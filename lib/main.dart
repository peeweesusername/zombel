import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:upgrader/upgrader.dart';
import './emums.dart';
import './globals.dart';
import './parsecontents.dart';
import './chapters.dart';
import './toc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A Novel by Olivia S',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyStory(),
    );
  }
}

class MyStory extends StatefulWidget {
  const MyStory({Key? key}) : super(key: key);

  @override
  State<MyStory> createState() => _MyStory();
}

class _MyStory extends State<MyStory> {

  getCounts() async {
    gFileText = await rootBundle.loadString('assets/bookcontents.json');

    setState(() {
      gNumberOfChapters = getNumberofChapters();
      for (int i = 0; i < gNumberOfChapters; i++) {
        int n = getNumberofParagraphs(i);
        gNumberOfParagraphs.add(n);
      }
    });
  }

  @override
  void initState() {
    getCounts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();

    if (kDebugMode) {
      Upgrader().clearSavedSettings();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF41407C),
        title: Text(getContent(BookContent.bookTitle)),
      ),
      endDrawer: ToC(gNumberOfChapters, _pageController),
      body: UpgradeAlert(
        messages:myUpgraderMessages(),
        showIgnore: false,
        child: Center(
            child: PageView(
              controller: _pageController,
              children: buildChapters(gNumberOfChapters),
        )),
      ),
    );
  }
}

class myUpgraderMessages extends UpgraderMessages {
  @override
  String? message(UpgraderMessage messageKey) {
      switch (messageKey) {
        case UpgraderMessage.body:
          return 'New content available for The First Ever Zombel!';
        case UpgraderMessage.buttonTitleIgnore:
          return 'Ignore';
        case UpgraderMessage.buttonTitleLater:
          return 'Later';
        case UpgraderMessage.buttonTitleUpdate:
          return 'Update Now';
        case UpgraderMessage.prompt:
          return 'Enjoy The Zombie Apocalypse';
        case UpgraderMessage.title:
          return 'New Content';
      }
  }
}