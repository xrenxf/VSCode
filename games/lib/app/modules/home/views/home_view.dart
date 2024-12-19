import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class WavyCloudPainter extends CustomPainter {
  final double waveProgress;
  WavyCloudPainter({required this.waveProgress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.fill;
    Path path = Path();
    // Meningkatkan ukuran gelombang
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(
          i,
          size.height / 2 +
              20 *
                  sin(i / 20 +
                      waveProgress)); // Meningkatkan amplitudo dan frekuensi gelombang
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavyCloudPainter oldDelegate) =>
      oldDelegate.waveProgress != waveProgress;
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween(begin: 0.0, end: 2 * pi).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Stack(
          children: [
            CustomPaint(
              painter: WavyCloudPainter(waveProgress: animation.value),
              child: Container(),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(),
                  Text(
                    'Jumper Bird',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
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
                  Image.asset('assets/images/icon-game.png'), // Logo game
                  const Spacer(),
                  ElevatedButton(
                    onPressed: controller.startGame,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent, // Warna tombol
                      padding:
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Mulai Bermain',
                        style: TextStyle(
                            color: Colors.white)), // Teks berwarna putih
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
