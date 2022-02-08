import 'package:flutter/material.dart';
import './emums.dart';
import './parsecontents.dart';

class ToC extends StatelessWidget {

  final List<GlobalKey>headLineKeyList;
  final int numberOfChapters;

  const ToC(this.numberOfChapters, this.headLineKeyList);

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
                style: TextStyle(
                    color: Color(0xFFF8F8F8), fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );

    return myBox;
  }

  List<Widget> getToCTiles(int count, List<GlobalKey>keyList) {
    List<Widget> tocTiles = List<Widget>.empty(growable:true);

    tocTiles.add(headerToC());

    for(int i=0; i<count; i++) {
      tocTiles.add(ListTile(
          onTap: () {
            Scrollable.ensureVisible(keyList[i].currentContext!,
                duration: const Duration(milliseconds: 500));
          },
          title: Text(getContent(BookContent.chapterTitle, i)),
        )
      );
    }
    return tocTiles;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: getToCTiles(numberOfChapters, headLineKeyList),
      ),
    );
  }
}