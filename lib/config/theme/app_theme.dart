import 'package:flutter/material.dart';

class AppTheme{

  static const Color _customColor =  Color(0xFF9000D3);
  static const List<Color> _colorThemes =  [
    _customColor,
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
  ];
  final int selectedColor;


  //Constructor
  AppTheme({this.selectedColor=0}):
              assert(selectedColor>=0 && selectedColor<_colorThemes.length);


  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.light
    );
  }
}