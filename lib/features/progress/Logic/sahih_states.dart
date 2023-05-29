import 'package:flutter/material.dart';

abstract class SahihStates {}

class SahihInitial extends SahihStates {}

class SahihLoading extends SahihStates {}

class SahihLoaded extends SahihStates {
  final List<Color> colors;

  List<String> names = [
    "رياض الصالحين",
    "صحيح البخاري",
    "صحيح مسلم",
    "الترمذي",
    "سنن الإمام أبي داود",
    "النسائي",
    "ابن ماجه",
    "الموطأ",
  ];

  SahihLoaded(this.colors);
}
