import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_weather/core/utils/constants/strings.dart';
import 'package:open_weather/core/utils/validations.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  final _isLoginEnabledStream = BehaviorSubject<bool>.seeded(false);
  final _isPasswordVisibleStream = BehaviorSubject<bool>.seeded(false);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void authenticate() {
    final isEmailOk = emailController.text.isEmail;
    final isPasswordOk = passwordController.text.isPassword;
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final isButtonEnabled = isEmailOk && isPasswordOk;
      doLogin(validation: isButtonEnabled);
    }
  }

  String? validateEmail(String? value) {
    if (!(value ?? Strings.empty).isEmail) {
      return Strings.invalidEmail;
    } else if (value?.isEmpty ?? false) {
      return Strings.invalidEmail;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (!(value ?? Strings.empty).isPassword) {
      return Strings.invalidPassword;
    } else if (value?.isEmpty ?? false) {
      return Strings.invalidPassword;
    }
    return null;
  }

  void doLogin({required bool validation}) {
    _isLoginEnabledStream.add(validation);
    if (_isLoginEnabledStream.value == true) {
      emit(const UserAuthenticated());
    }
  }

  void togglePasswordVisibility() =>
      _isPasswordVisibleStream.add(!_isPasswordVisibleStream.value);
}
