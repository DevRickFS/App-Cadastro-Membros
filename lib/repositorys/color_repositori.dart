import 'package:flutter/material.dart';

class ColorRepository {
 final  Color _corPrincipal = Colors.blue.shade800;
  final Color _letterColor = Colors.black87;

  ColorRepository();

  Color get corPrincipal => _corPrincipal;
  Color get letterColor => _letterColor;
}