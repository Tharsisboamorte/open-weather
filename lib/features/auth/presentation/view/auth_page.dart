import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/core/extensions/media_query_values.dart';
import 'package:open_weather/core/res/app_values.dart';
import 'package:open_weather/core/utils/constants/strings.dart';
import 'package:open_weather/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:open_weather/features/auth/presentation/widget/default_button.dart';
import 'package:open_weather/features/auth/presentation/widget/password_indicator.dart';
import 'package:open_weather/features/auth/presentation/widget/text_form_field.dart';

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
              width: context.width * .6,
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppValues.padding30,
                      ),
                      child: Text(
                        Strings.login,
                      ),
                    ),
                    AppTextFormField(
                      editingController: cubit.emailController,
                      fieldLabel: Strings.email,
                      hint: Strings.emailHint,
                      validator: cubit.validateEmail,
                    ),
                    SizedBox(
                      height: context.width * .02,
                    ),
                    AppTextFormField(
                      editingController: cubit.passwordController,
                      fieldLabel: Strings.password,
                      isPassword: true,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: AppValues.padding30,
                    //     vertical: AppValues.padding12,
                    //   ),
                    //   child: PasswordIndicator(
                    //     passwordController: cubit.passwordController,
                    //   ),
                    // ),
                    SizedBox(
                      height: context.width * .01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppValues.padding23,
                      ),
                      child: DefaultButton(
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
