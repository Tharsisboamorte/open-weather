import 'package:open_weather/core/utils/constants/regex.dart';

extension StringExtensions on String {
  bool get isEmail => contains(RegExp(RegexConstants.emailRegex as String));

  bool get isPassword =>
      contains(RegExp(RegexConstants.passwordRegex as String));
}
