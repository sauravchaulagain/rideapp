import 'package:flutter/material.dart';

class SizeUtils {
  factory SizeUtils() {
    return _sizeUtils;
  }
  SizeUtils._internal();

  static final SizeUtils _sizeUtils = SizeUtils._internal();

  static const double _designHeight = 812;
  static const double _designWidth = 375;

  static double _currentWidth = 375;
  static double _currentHeight = 812;

  static double _scale = 1;
  static double _textScaleFactor = 1;

  static double get scaleFactor => _scale;
  static double get textScaleFactor => _textScaleFactor;

  static double get width => _currentWidth;
  static double get height => _currentHeight;

  static void init({required BuildContext context}) {
    _currentWidth = MediaQuery.of(context).size.width;
    _currentHeight = MediaQuery.of(context).size.height;
    _scale = _designWidth / _currentWidth;
    _textScaleFactor = _currentWidth / _designWidth;
  }

  static DeviceType get type {
    if (_currentWidth <= 360) {
      return DeviceType.Small;
    } else if (_currentWidth <= 540 && _currentWidth > 360) {
      return DeviceType.Medium;
    } else {
      return DeviceType.Large;
    }
  }

  static bool get isSmallPhone => type == DeviceType.Small;

  static bool get isMediumPhone => type == DeviceType.Medium;

  static bool get isLargePhone => type == DeviceType.Large;
}

extension SizeExtension on num {
  double get wp {
    return (this / SizeUtils._designWidth) * SizeUtils._currentWidth;
  }

  double get hp {
    return (this / SizeUtils._designHeight) * SizeUtils._currentHeight;
  }

  double get w {
    return (this * SizeUtils._currentWidth) / 100;
  }

  double get h {
    return (this * SizeUtils._currentHeight) / 100;
  }
}

enum DeviceType { Small, Medium, Large }
