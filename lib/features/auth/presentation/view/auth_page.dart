import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/core/extensions/media_query_values.dart';
import 'package:open_weather/core/res/typography.dart';
import 'package:open_weather/core/utils/constants/strings.dart';
import 'package:open_weather/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:open_weather/features/auth/presentation/widget/default_button.dart';
import 'package:open_weather/features/auth/presentation/widget/text_form_field.dart';
import 'package:open_weather/features/home/presentation/view/home_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const routeName = '/';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UserAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Successfully')),
          );
          Navigator.of(context).pushNamed(HomeScreen.routeName);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 3,
                ),
              ),
              height: context.height * .6,
              width: context.width * .4,
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: context.height * .03,
                      ),
                      child: Text(
                        Strings.login,
                        style: AppTextStyle.instance.h1Bold,
                      ),
                    ),
                    AppTextFormField(
                      editingController: cubit.emailController,
                      fieldLabel: Strings.email,
                      hint: Strings.emailHint,
                      validator: cubit.validateEmail,
                    ),
                    SizedBox(
                      height: context.width * .03,
                    ),
                    AppTextFormField(
                      editingController: cubit.passwordController,
                      fieldLabel: Strings.password,
                      isPassword: true,
                      validator: cubit.validatePassword,
                    ),
                    SizedBox(
                      height: context.width * .01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.width * .07,
                        vertical: context.height * .02,
                      ),
                      child: DefaultButton(
                        height: context.height * .05,
                        width: context.height * .64,
                        buttonLabel: Strings.login,
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.white10),
                        onPressed: cubit.authenticate,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
