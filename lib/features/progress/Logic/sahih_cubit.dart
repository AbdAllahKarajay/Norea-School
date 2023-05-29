import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'sahih_states.dart';

export 'sahih_states.dart';

class SahihCubit extends Cubit<SahihStates> {

  List<Color> colors=[];

  SahihCubit(super.initialState);


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


    // for (String sahih in names) {
    //    Color color = await _updatePaletteGenerator(sahih);
    //    colors.add(color);
    // }
    colors = const[
      Color(0xff406070),
      Color(0xff005050),
      Color(0xff4f2020),
      Color(0xff306030),
      Color(0xffb08030),
      Color(0xff683060),
      Color(0xff3090c0),
      Color(0xff607840),
    ];

    emit(SahihLoaded(colors));
  }


  Future<Color> _updatePaletteGenerator(String name) async {
    var paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.asset("images/$name.png").image,
    );
    final c = paletteGenerator.dominantColor!.color;
    return c;
  }

}