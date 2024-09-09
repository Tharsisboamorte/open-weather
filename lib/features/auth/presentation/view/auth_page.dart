import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/core/extensions/media_query_values.dart';
import 'package:open_weather/core/utils/constants/strings.dart';
import 'package:open_weather/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:open_weather/features/auth/presentation/widget/text_form_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const routeName = '/';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueAccent,
                ),
              ),
              height: context.height * .5,
              width: context.width * .6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    Strings.login,
                  ),
                  AppTextFormField(
                    editingController: emailController,
                    fieldLabel: Strings.email,
                  ),
                  SizedBox(height:  context.width * .05,),
                  AppTextFormField(
                    editingController: passwordController,
                    fieldLabel: Strings.password,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
