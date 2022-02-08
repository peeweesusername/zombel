import 'package:flutter/material.dart';

class Headline1 extends StatelessWidget {
  const Headline1({Key? key, required this.headline1}) : super(key: key);
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
/*
class Headline2 extends StatelessWidget {
  const Headline2({Key? key, required this.headline2}) : super(key: key);
  final String headline2;
 */
class Headline2 extends StatelessWidget {
  final String headline2;
  const Headline2({Key? key, required this.headline2}) : super(key: key);

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
  const Paragraph({Key? key, required this.content}) : super(key: key);
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
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