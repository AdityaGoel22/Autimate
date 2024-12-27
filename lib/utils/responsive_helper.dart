import 'package:flutter/material.dart';

class ResponsiveHelper {
  final BuildContext context;
  late final double _width;
  late final double _height;
  late final double _paddingTop;
  late final double _paddingBottom;

  ResponsiveHelper(this.context) {
    final mediaQuery = MediaQuery.of(context);
    _width = mediaQuery.size.width;
    _height = mediaQuery.size.height;
    _paddingTop = mediaQuery.padding.top;
    _paddingBottom = mediaQuery.padding.bottom;
  }

  double get width => _width;
  double get height => _height;
  double get paddingTop => _paddingTop;
  double get paddingBottom => _paddingBottom;

  EdgeInsets get defaultPadding => EdgeInsets.symmetric(
        horizontal: 20,
        vertical: _paddingTop, // Top padding to avoid overlap with status bar
      );

  EdgeInsets get formPadding => const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      );
}
