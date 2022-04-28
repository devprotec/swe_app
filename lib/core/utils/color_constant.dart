import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black900 = fromHex('#000000');

  static Color whiteA700D8 = fromHex('#d8ffffff');

  static Color bluegray400 = fromHex('#888888');

  static Color deepOrange900 = fromHex('#993300');

  static Color red900 = fromHex('#a8211a');

  static Color black90040 = fromHex('#40000000');

  static Color red200 = fromHex('#db8a8a');

  static Color bluegray100 = fromHex('#cccccc');

  static Color gray200 = fromHex('#ededed');

  static Color black9003f = fromHex('#3f000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color black900D8 = fromHex('#d8000000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
