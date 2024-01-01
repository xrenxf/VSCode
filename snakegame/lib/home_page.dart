import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snakegame/blank_pixel.dart';
import 'package:snakegame/food_pixel.dart';
import 'package:snakegame/highscore_tile.dart';
import 'package:snakegame/snake_pixel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum snake_Direction { UP, DOWN, LEFT, RIGHT }

class _HomePageState extends State<HomePage> {
  // Grid Dimensions
  int rowSize = 10;
  int totalNumbersOfSquares = 100;

  // game settings
  bool gameHasStarted = false;
  final _nameController = TextEditingController();

  // user score
  int currentScore = 0;

  // Snake Position
  List<int> snakePos = [
    0,
    1,
    2,
  ];

  // Snake direction is initially to the right
  var currentDirection = snake_Direction.RIGHT;

  // Food Position
  int foodPos = 55;

  // highscores list
  List<String> highscore_DocIds = [];
  late final Future? letsGetDocIds;

  @override
  void initState() {
    letsGetDocIds = getDocIds();
    super.initState();
  }

  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection("highscores")
        .orderBy("score", descending: true)
        .limit(10)
        .get()
        .then((value) => value.docs.forEach((element) {
              highscore_DocIds.add(element.reference.id);
            }));
  }

  // Start The Game!
  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        // keep the snake moving
        moveSnake();

        // check if the game is over
        if (gameOver()) {
          timer.cancel();

          // display a message to the user
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: const Text('Game Over'),
                content: Column(
                  children: [
                    Text('Your score is: ' + currentScore.toString()),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(hintText: 'Enter name'),
                    )
                  ],
                ),
                actions: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      submitScore();
                      newGame();
                    },
                    child: Text('Submit'),
                    color: Colors.pink,
                  )
                ],
              );
            },
          );
        }
      });
    });
  }

  void submitScore() {
    // get access to the collection
    var database = FirebaseFirestore.instance;

    // add data to firebase
    database.collection('highscores').add({
      "name": _nameController.text,
      "score": currentScore,
    });
  }

  Future newGame() async {
    highscore_DocIds = [];
    await getDocIds();

    setState(() {
      snakePos = [
        0,
        1,
        2,
      ];
      foodPos = 55;
      currentDirection = snake_Direction.RIGHT;
      gameHasStarted = false;
      currentScore = 0;
    });
  }

  void eatFood() {
    currentScore++;
    // making sure the new food is not where the snake is
    while (snakePos.contains(foodPos)) {
      foodPos = Random().nextInt(totalNumbersOfSquares);
    }
  }

  void moveSnake() {
    switch (currentDirection) {
      case snake_Direction.RIGHT:
        {
          // add a head
          // if snake is at the right wall, need to re-adjust
          if (snakePos.last % rowSize == 9) {
            snakePos.add(snakePos.last + 1 - rowSize);
          } else {
            snakePos.add(snakePos.last + 1);
          }
        }
        break;
      case snake_Direction.LEFT:
        {
          // add a head
          // if snake is at the right wall, need to re-adjust
          if (snakePos.last % rowSize == 0) {
            snakePos.add(snakePos.last - 1 + rowSize);
          } else {
            snakePos.add(snakePos.last - 1);
          }
        }
        break;
      case snake_Direction.UP:
        {
          // add a head
          if (snakePos.last < rowSize) {
            snakePos.add(snakePos.last - rowSize + totalNumbersOfSquares);
          } else {
            snakePos.add(snakePos.last - rowSize);
          }
        }
        break;
      case snake_Direction.DOWN:
        {
          // add a head
          if (snakePos.last + rowSize > totalNumbersOfSquares) {
            snakePos.add(snakePos.last + rowSize - totalNumbersOfSquares);
          } else {
            snakePos.add(snakePos.last + rowSize);
          }
        }
        break;
      default:
    }

    // snake is eating food
    if (snakePos.last == foodPos) {
      eatFood();
    } else {
      // remove tail
      snakePos.remove(0);
    }
  }

  // gameover
  bool gameOver() {
    // this list is the body of the snake (no head)
    List<int> bodySnake = snakePos.sublist(0, snakePos.length - 1);
    if (bodySnake.contains(snakePos.last)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKey: (event) {
          if (event.isKeyPressed(LogicalKeyboardKey.arrowDown) &&
              currentDirection != snake_Direction.UP) {
            currentDirection = snake_Direction.DOWN;
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowUp) &&
              currentDirection != snake_Direction.DOWN) {
            currentDirection = snake_Direction.UP;
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft) &&
              currentDirection != snake_Direction.RIGHT) {
            currentDirection = snake_Direction.LEFT;
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight) &&
              currentDirection != snake_Direction.LEFT) {
            currentDirection = snake_Direction.RIGHT;
          }
        },
        child: SizedBox(
          width: screenWidth > 428 ? 428 : screenWidth,
          child: Column(
            children: [
              // High Score
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // user current score
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Current Score'),
                          Text(
                            currentScore.toString(),
                            style: const TextStyle(fontSize: 36),
                          ),
                        ],
                      ),
                    ),

                    // highscore, top 5 or 10
                    Expanded(
                        child: gameHasStarted
                            ? Container()
                            : FutureBuilder(
                                future: letsGetDocIds,
                                builder: (context, snapshot) {
                                  return ListView.builder(
                                    itemCount: highscore_DocIds.length,
                                    itemBuilder: ((context, Index) {
                                      return HighScoreTile(
                                          documentId: highscore_DocIds[Index]);
                                    }),
                                  );
                                }))
                  ],
                ),
              ),

              // Game Grid
              Expanded(
                flex: 3,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.delta.dy > 0 &&
                        currentDirection != snake_Direction.UP) {
                      currentDirection = snake_Direction.DOWN;
                    } else if (details.delta.dy < 0 &&
                        currentDirection != snake_Direction.DOWN) {
                      currentDirection = snake_Direction.UP;
                    }
                  },
                    
                  onHorizontalDragUpdate: (details) {
                    if (details.delta.dx > 0 &&
                        currentDirection != snake_Direction.LEFT) {
                      currentDirection = snake_Direction.RIGHT;
                    } else if (details.delta.dx < 0 &&
                        currentDirection != snake_Direction.RIGHT) {
                      currentDirection = snake_Direction.LEFT;
                    }
                  },
                  
                  child: GridView.builder(
                    itemCount: totalNumbersOfSquares,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: rowSize,
                    ),
                    itemBuilder: (context, index) {
                      if (snakePos.contains(index)) {
                        return const SnakePixel();
                      } else if (foodPos == index) {
                        return const FoodPixel();
                      } else {
                        return const BlankPixel();
                      }
                    }
                  ),
                )
              ),

              //Play Button
              Expanded(
                child: Container(
                child: Center(
                  child: MaterialButton(
                    child: Text('PLAY'),
                    color: gameHasStarted ? Colors.grey : Colors.pink,
                    onPressed: gameHasStarted ? () {} : startGame,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
