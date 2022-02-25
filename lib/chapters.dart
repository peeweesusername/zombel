import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import './emums.dart';
import './globals.dart';
import './format.dart';
import './parsecontents.dart';

List<Widget> buildChapters(int count) {
  List<Widget> chapters = List<Widget>.empty(growable: true);

  chapters.add(Container (
      alignment: Alignment.center,
      child: SingleChildScrollView(
      child: Column(
          children: getCoverPage(),
        ),
      ),
    ),
  );

  for (int i = 0; i < count; i++) {
    List<Widget> page = List<Widget>.empty(growable: true);
    page.add(Headline2(
        headline2: getContent(BookContent.chapterTitle, i)));
    for (int j = 0; j < gNumberOfParagraphs[i]; j++) {
      page.add(
          Paragraph(content: getContent(BookContent.chapterContent, i, j)));
    }

    if (getContent(BookContent.chapterImage, i) != 'noimage'){
      page.add(
          Image(image: AssetImage(getContent(BookContent.chapterImage, i)))
      );
    }

    if (getContent(BookContent.chapterTitle, i) == 'Stay Tuned....') {
      print(getContent(BookContent.playstoreURL, i));
      page.add(getURLLauncher(getContent(BookContent.playstoreURL, i)));
    }

    chapters.add(SingleChildScrollView(
      child: Column(children: page),
      controller: ScrollController(keepScrollOffset: true),
    ));
  }
  return chapters;
}

getCoverPage() {
  List<Widget> page = List<Widget>.empty(growable: true);

  var imagepath = getContent(BookContent.coverart);
  if (imagepath == '1') {
    imagepath = '';
  }

  var title = getContent(BookContent.bookTitle);
  if (title == '1') {
    title = '';
  }

  var author = getContent(BookContent.author);
  if (author == '1') {
    author = '';
  }

  var copyright = getContent(BookContent.copyright);
  if (copyright == '1') {
    copyright = '';
  }

  page.add(Stack(
      children: <Widget>[
        if (imagepath != '')
          Image(
            image: AssetImage(imagepath),
          ),
        Column(children: [
          Center(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                  fontSize: 50,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold))),
          Center(
              child: Text('Written and Illustrated By ' + author,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                  fontSize: 30,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold)))
          ]),
      ])
  );

  page.add(Center(
      child: Text('\u00A9 ' + copyright,
              textAlign: TextAlign.center,
              style: const TextStyle(
              fontSize: 10,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold))));

  return page;
}

getURLLauncher(String mylink){
  return Link(
    uri: Uri.parse(mylink),
    target: LinkTarget.blank,
    builder: (BuildContext ctx, FollowLink? openLink) {
      return TextButton.icon(
        onPressed: openLink,
        label: const Text('Check for updates here'),
        icon: const Icon(Icons.link),
      );
      },
  );
}
