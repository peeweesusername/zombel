import 'package:flutter/material.dart';
import 'dart:convert';
import './emums.dart';
import './globals.dart';

class ParseBookContents extends Text{
  final BookContent contentType;
  final int chapterNumber;
  final int paragraphNumber;
  final String fileText;

  const ParseBookContents(this.fileText, this.contentType, [this.chapterNumber=0, this.paragraphNumber=0]) : super('');

  @override
  Widget build(BuildContext context) {
    return getContent(contentType, chapterNumber, paragraphNumber);
  }
}

getContent(contentType, [chapterNumber=0, paragraphNumber=0]) {
  var parsedJson={};
  var content='';

  if (gFileText == 'notloaded'){
    return '1';
  }

  parsedJson = jsonDecode(gFileText);

  switch(contentType){
    case BookContent.appTitle: {
      content = parsedJson['apptitle'];
    }
    break;

    case BookContent.bookTitle: {
      content = parsedJson['booktitle'];
    }
    break;

    case BookContent.author: {
      content = parsedJson['author'];
    }
    break;

    case BookContent.copyright: {
      content = parsedJson['copyright'];
    }
    break;

    case BookContent.coverart: {
      content = parsedJson['coverart'];
    }
    break;

    case BookContent.playstoreURL: {
      content = parsedJson['playstoreURL'];
    }
    break;

    case BookContent.numberOfChapters: {
      int i = parsedJson['chapters'].length;
      content = i.toString();
    }
    break;

    case BookContent.chapterTitle: {
      content = parsedJson['chapters'][chapterNumber]['chapterTitle'];
    }
    break;

    case BookContent.numberOfParagraphs: {
      int j = parsedJson['chapters'][chapterNumber]['paragraphs'].length;
      content = j.toString();
    }
    break;

    case BookContent.chapterContent: {
      content = parsedJson['chapters'][chapterNumber]['paragraphs'][paragraphNumber]['paragraph'];
    }
    break;

    case BookContent.chapterImage: {
      content = parsedJson['chapters'][chapterNumber]['chapterImage'];
    }
    break;
  }
  return content;
}

int getNumberofChapters() {
  var parsedJson = jsonDecode(gFileText);
  int i = parsedJson['chapters'].length;
  return i;
}

int getNumberofParagraphs(int chapterNumber) {
  var parsedJson = jsonDecode(gFileText);
  int i = parsedJson['chapters'][chapterNumber]['paragraphs'].length;
  return i;
}
