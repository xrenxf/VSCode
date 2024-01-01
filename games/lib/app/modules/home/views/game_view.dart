import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';

class GameView extends StatelessWidget {
  final GameController controller = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    controller.startGame();

    double screenHeight = MediaQuery.of(context).size.height;
    double groundHeight = screenHeight / 3;
    double playerBaseY = groundHeight - 10; // Posisi dasar pemain di atas tanah
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: GestureDetector(
        onTap: controller.jump,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: groundHeight,
                color: Colors.brown,
              ),
            ),
            Obx(() => Positioned(
                  right: screenWidth * controller.obstacleX.value,
                  bottom: groundHeight - 50, // Posisi rintangan di atas tanah
                  child: Container(
                    width: screenWidth * controller.obstacleWidth,
                    height: screenHeight * controller.obstacleHeight,
                    color: Colors.red,
                  ),
                )),
            Obx(() => Positioned(
                  bottom: playerBaseY + (controller.playerY.value - 1.0) * 100,
                  right: screenWidth *
                      0.2, // Pemain dipindahkan ke sebelah kanan layar
                  child: Image.asset('assets/images/icon-game.png',
                      width: 50, height: 50),
                )),
            Obx(() => Positioned(
                  top: 50,
                  right: 20,
                  child: Text(
                    'Score: ${controller.score.value}',
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                )),
            // Tombol Replay
            Obx(() => AnimatedOpacity(
                  opacity: controller.isGameOver.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: controller.isGameOver.value
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'High Score: ${controller.score.value}',
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Colors.yellowAccent,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black.withOpacity(0.5),
                                      offset: const Offset(3, 3),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () => controller.resetGame(),
                                child: const Text('Replay'),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                )),
          ],
        ),
      ),
    );
  }
}
