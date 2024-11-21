import 'package:flutter/material.dart';

const Color _customColor = Color(0xff49149F);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Color(0xff0078d4),
  Colors.teal,
  Colors.green,
  Colors.greenAccent,
  Colors.yellow,
  Colors.orange,
  Colors.pink,

];

class AppTheme{

  final int selectedColor;

  AppTheme({this.selectedColor = 0})
  : assert(selectedColor >= 0 && selectedColor <= _colorTheme.length -1,'Tiene que estar entre 0 y 6');
  
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedColor],
      brightness: Brightness.dark
    );
  }
}