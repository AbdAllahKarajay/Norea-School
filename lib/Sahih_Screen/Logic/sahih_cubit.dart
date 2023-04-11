import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:norea_school_student/Sahih_Screen/Logic/sahih_states.dart';

class SahihCubit extends Cubit<SahihStates> {

  SahihCubit(super.initialState);

  List<Color> colors=[];


  getColors() async {


    List<String> names=[
      "رياض الصالحين",
      "صحيح البخاري",
      "صحيح مسلم",
      "الترمذي",
      "سنن الإمام أبي داود",
      "النسائي",
      "ابن ماجه",
      "الموطأ",
  ];

    emit(SahihLoading());


    for (String sahih in names) {
       Color color = await _updatePaletteGenerator(sahih);
       colors.add(color);
    }

    emit(SahihLoaded(colors));
  }


  Future<Color> _updatePaletteGenerator(String name) async {
    var paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.asset("images/$name.png").image,
    );
    return paletteGenerator.dominantColor!.color;
  }

}