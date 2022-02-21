import 'package:flutter/material.dart';

class Headline1 extends StatelessWidget {
  const Headline1({required this.headline1});
  final String headline1;

  @override
  Widget build(BuildContext context) {
    return Text(
      headline1,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 22,
        fontFamily: 'Georgia',
        color: Color(0xFF010101),
      ),
      textAlign: TextAlign.center,
    );
  }
}

class Headline2 extends StatelessWidget {
  const Headline2({required this.headline2});
  final String headline2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        headline2,
        style: const TextStyle(
          fontFamily: 'Georgia',
          fontWeight: FontWeight.w800,
          fontSize: 18,
          color: Color(0xFF010101),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Paragraph extends StatelessWidget {
  const Paragraph({required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      child: Text(
        content,
        style: const TextStyle(
          height: 1.5,
          fontFamily: "Georgia",
          fontSize: 15.0,
          color: Color(0xFF010101),
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}