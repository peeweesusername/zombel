import 'package:flutter/material.dart';
import './emums.dart';
import './globals.dart';
import './format.dart';
import './parsecontents.dart';

  List<Widget> buildChapters(int count, List<GlobalKey>headLineKeyList)  {
    List<Widget> chapters = List<Widget>.empty(growable:true);


    var copyright = getContent(BookContent.copyright);
    if (copyright == '1'){
      copyright = '';
    }

    chapters.add(getCoverPage());
    chapters.add(Center(child: Text(copyright, style: const TextStyle(fontSize: 10, color: Colors.deepPurple, fontWeight: FontWeight.bold))));

    for (int i=0; i<count; i++) {
      chapters.add(Headline2(key: headLineKeyList[i], headline2: getContent(BookContent.chapterTitle, i)));
      for (int j=0; j<gNumberOfParagraphs[i]; j++) {
        chapters.add(Paragraph(content: getContent(BookContent.chapterContent, i, j)));
      }
    }
    return chapters;
  }

  getCoverPage(){
    var imagepath = getContent(BookContent.coverart);
    if (imagepath == '1'){
      imagepath = '';
    }

    var title = getContent(BookContent.bookTitle);
    if (title == '1'){
      title = '';
    }

    var author = getContent(BookContent.author);
    if (author == '1'){
      author = '';
    }

    return Stack(
      children: <Widget>[
        if(imagepath != '') Image (
              fit: BoxFit.fitHeight,
              image: AssetImage(imagepath),
          ),
        Column(
          children: [
            Center(
                child:
                  Text(title, style: const TextStyle(fontSize: 50, color: Colors.deepPurple, fontWeight: FontWeight.bold))
            ),
            Center(
                child:
                Text('A Novel By '+author, style: const TextStyle(fontSize: 30, color: Colors.deepPurple, fontWeight: FontWeight.bold))
            )
          ]
        ),
      ]
    );
  }
