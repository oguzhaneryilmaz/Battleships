import 'package:flutter/material.dart';

List<String> trueSelectedBig = [
  "first",
  "first",
  "first",
  "first",
  "first",
];

List<String> trueSelectedSmall = [
  "first",
  "first",
  "first",
];

List<String> trueSelectedSmall2 = [
  "first",
  "first",
  "first",
];

// 100 elemanlı her elemanı "first" olan string liste oluşturma fonksiyonu

List wrongSelectedBig = List<String>.generate(100, (i) => "First");
List wrongSelectedSmall = List<String>.generate(100, (i) => "First");
List wrongSelectedSmall2 = List<String>.generate(100, (i) => "First");
