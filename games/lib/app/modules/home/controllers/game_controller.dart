import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class GameController extends GetxController {
  Rx<double> playerY = 1.0.obs;
  Rx<double> obstacleX = 2.0.obs;
  var isJumping = false.obs;
  var isGameOver = false.obs;
  var score = 0.obs;

  final double obstacleWidth = 0.1;
  final double obstacleHeight = 0.15;
  int gameSpeed = 20; // Kecepatan awal game

  double gravity =
      -9.8; // Gravitasi, prinsip fisika yang mempengaruhi gerakan vertikal pemain
  double velocityY = 0.0; // Kecepatan vertikal, berubah karena gravitasi
  double initialJumpVelocity =
      5.0; // Kecepatan awal lompat, menciptakan gerakan parabolik

  late double maxJumpHeight;
  final double groundLevel = 1.0;
  final double playerWidth = 0.1;
  final double playerHeight = 0.1;

  double obstacleMoveSpeed = 0.01; // Kecepatan awal pergerakan rintangan

  final AudioPlayer _audioPlayer = AudioPlayer();

  GameController() {
    maxJumpHeight = initialJumpVelocity * initialJumpVelocity / (2 * -gravity);
  }

  void jump() {
    if (!isJumping.value && !isGameOver.value) {
      isJumping.value = true;
      velocityY =
          initialJumpVelocity; // Mengatur kecepatan awal lompatan (Gerakan Parabolik)
    }
  }

  void updatePlayerPosition() {
    // Update posisi Y pemain
    velocityY += gravity * gameSpeed / 1000;
    playerY.value += velocityY * gameSpeed / 1000;

    // Pastikan pemain tidak jatuh di bawah ground level
    if (playerY.value < groundLevel) {
      playerY.value = groundLevel;
      isJumping.value = false;
      velocityY = 0.0;
    }
  }

  void startGame() {
    isGameOver.value = false;
    score.value = 0;
    playerY.value = groundLevel;
    obstacleX.value = 2.0;
    obstacleMoveSpeed = 0.01;

    Future.doWhile(() async {
      await Future.delayed(Duration(milliseconds: gameSpeed));

      if (isGameOver.value) {
        return false; // Menghentikan loop jika game over
      }

      // Update posisi Y pemain berdasarkan gravitasi dan kecepatan (Gerakan Parabolik)
      velocityY += gravity * gameSpeed / 1000;
      playerY.value += velocityY * gameSpeed / 1000;

      // Memastikan pemain tidak jatuh di bawah ground level (Pengaruh Gravitasi)
      // Pastikan pemain tidak jatuh di bawah ground level
      if (playerY.value < groundLevel) {
        playerY.value = groundLevel;
        isJumping.value = false;
        velocityY = 0.0;
      }
      updatePlayerPosition();

      // Bergerakkan rintangan
      obstacleX.value -= obstacleMoveSpeed;
      if (obstacleX.value < 0) {
        obstacleX.value = 2.0;
        score.value++;
        playPointSound();
        if (score.value % 3 == 0) {
          obstacleMoveSpeed += 0.005;
        }
      }

      // Cek tabrakan
      if (isCollision()) {
        isGameOver.value = true;
        playReplaySound();
        // Hentikan pergerakan objek saat tabrakan
        stopMovement();
        return false;
      }

      return true;
    });
  }

  void stopMovement() {
    // Hentikan pergerakan objek dan rintangan
    velocityY = 0.0;
    obstacleMoveSpeed = 0.0;
  }

  bool isCollision() {
    // Hitung batas pemain dengan lebih akurat
    double playerLeftEdge = 0.2 - playerWidth / 2;
    double playerRightEdge = 0.2 + playerWidth / 2;
    double playerTopEdge = playerY.value;
    double playerBottomEdge = playerY.value + playerHeight;

    // Hitung batas rintangan dengan lebih akurat
    double obstacleLeftEdge = obstacleX.value - obstacleWidth / 2;
    double obstacleRightEdge = obstacleX.value + obstacleWidth / 2;
    double obstacleTopEdge = groundLevel;
    double obstacleBottomEdge = groundLevel + obstacleHeight;

    // Deteksi tabrakan berdasarkan posisi dan dimensi objek (Prinsip Fisika dalam Deteksi Tabrakan)
    // Cek tabrakan horizontal dan vertikal
    bool collisionHorizontal = playerRightEdge >= obstacleLeftEdge &&
        playerLeftEdge <= obstacleRightEdge;
    bool collisionVertical = playerBottomEdge >= obstacleTopEdge &&
        playerTopEdge <= obstacleBottomEdge;

    // Mengatasi bug tabrakan pada kecepatan tinggi
    // Metode ini memeriksa apakah pemain akan menabrak rintangan pada frame berikutnya
    double nextPlayerRightEdge = playerRightEdge + obstacleMoveSpeed;
    bool futureCollisionHorizontal = nextPlayerRightEdge >= obstacleLeftEdge &&
        playerLeftEdge <= obstacleRightEdge;

    return (collisionHorizontal || futureCollisionHorizontal) &&
        collisionVertical;
  }

  void increaseScore() {
    score.value++;
    playPointSound();
  }

  void submitScore() {
    // get access to the collection
    var database = FirebaseFirestore.instance;

    // add data to firebase
    database.collection('highscores').add({
      "score": score.value,
    });
  }

  void resetGame() {
    isGameOver.value = false;
    score.value = 0;
    playerY.value = groundLevel;
    obstacleX.value = 2.0;
    obstacleMoveSpeed = 0.01; // Reset kecepatan rintangan
    startGame();
  }

  void playPointSound() async {
    await _audioPlayer.play(AssetSource('sounds/poin.mp3'));
  }

  void playReplaySound() async {
    await _audioPlayer.play(AssetSource('sounds/game-over.mp3'));
  }
}
