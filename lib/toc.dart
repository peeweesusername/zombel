import 'package:flutter/material.dart';
import './emums.dart';
import './parsecontents.dart';

class ToC extends StatelessWidget {
  const ToC(this.numberOfChapters, this.pageController);

  final int numberOfChapters;
  final PageController pageController;

  SizedBox headerToC() {
    var myBox = SizedBox(
      height: 100,
      child: DrawerHeader(
        decoration: const BoxDecoration(color: Color(0xFF41407C)),
        child: Stack(
          children: const <Widget>[
            Center(
              child: Text(
                'Table of Contents',
                style: TextStyle(color: Color(0xFFF8F8F8), fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );

    return myBox;
  }

  List<Widget> getToCTiles(int count) {
    List<Widget> tocTiles = List<Widget>.empty(growable: true);

    tocTiles.add(headerToC());

    //Add the cover page to the ToC
    tocTiles.add(ListTile(
      onTap: () {
        pageController.jumpToPage(0);
      },
      title: Text('Cover Page'),
    ));

    //Cover page is on page[0] so add +1 for chapters
    for (int i = 0; i < count; i++) {
      tocTiles.add(ListTile(
        onTap: () {
          pageController.jumpToPage(i + 1);
        },
        title: Text(getContent(BookContent.chapterTitle, i)),
      ));
    }
    return tocTiles;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: getToCTiles(numberOfChapters),
      ),
    );
  }
}
