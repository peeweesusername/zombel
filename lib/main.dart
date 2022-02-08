import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
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
  final ScrollController _scrollController = ScrollController();

  getCounts() async {
    gFileText = await rootBundle.loadString('assets/bookcontents.json');

    setState(() {
      gNumberOfChapters = getNumberofChapters();
      for(int i=0; i<gNumberOfChapters; i++) {
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
    var headLineKeyList = [for (var i = 1; i <= gNumberOfChapters; i++) GlobalKey()];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF41407C),
        title: Text(getContent(BookContent.bookTitle)),
      ),
      endDrawer: ToC(gNumberOfChapters, headLineKeyList),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildChapters(gNumberOfChapters, headLineKeyList)
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
