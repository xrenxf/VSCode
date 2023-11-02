import 'package:flutter/material.dart';

class TextDecorator extends StatelessWidget {
  final Widget child;
  const TextDecorator({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xffccccff),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}