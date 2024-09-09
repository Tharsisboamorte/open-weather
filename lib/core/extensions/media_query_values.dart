import 'package:flutter/cupertino.dart';

extension MediaQueryValues on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;
}
