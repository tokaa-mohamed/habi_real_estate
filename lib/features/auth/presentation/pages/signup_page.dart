import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/custom_logo.dart';
import '../../../../core/constant/snakbar.dart';
import '../../../../core/di.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/app_texts.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_button.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();

    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      if (_passwordController.text != _confirmPasswordController.text) {
        CustomSnackbar(
          AppColors.errorColor,
          AppTexts.passwordsDoNotMatch,
          true,
        ).show(context);
        return;
      }

      context.read<AuthCubit>().signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        fullName: _fullNameController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.darkColor,
            ),
            onPressed: () => context.router.maybePop(),
          ),
        ),
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailureState) {
                CustomSnackbar(
                  AppColors.errorColor,
                  state.message,
                  true,
                ).show(context);
              } else if (state is AuthAuthenticated) {
                CustomSnackbar(
                  AppColors.successColor,
                  'Account created successfully',
                  false,
                ).show(context);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomLogo(),
                      SizedBox(height: 20.h),
                      Text(
                        AppTexts.createAccount,
                        style: getBoldStyle(
                          fontSize: 20.sp,
                          color: AppColors.darkColor,
                        ),
                      ),
                      SizedBox(height: 28.h),
                      AuthTextField(
                        label: AppTexts.fullNameLabel,
                        hintText: AppTexts.fullNameHint,
                        controller: _fullNameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppTexts.pleaseEnterName;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      AuthTextField(
                        label: AppTexts.emailLabel,
                        hintText: AppTexts.emailHint,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppTexts.pleaseEnterEmail;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      AuthTextField(
                        label: AppTexts.passwordLabel,
                        hintText: AppTexts.passwordHint,
                        controller: _passwordController,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return AppTexts.passwordMinLength;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      AuthTextField(
                        label: AppTexts.confirmPasswordLabel,
                        hintText: AppTexts.confirmPasswordHint,
                        controller: _confirmPasswordController,
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return AppTexts.passwordsDoNotMatch;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 28.h),
                      PrimaryButton(
                        text: AppTexts.signUpLink,
                        isLoading: state is AuthLoading,
                        onPressed: () => _onSignUpPressed(context),
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppTexts.alreadyHaveAccount,
                            style: getRegularStyle(
                              fontSize: 13.sp,
                              color: AppColors.darkColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.router.maybePop();
                            },
                            child: Text(
                              AppTexts.loginLink,
                              style: getBoldStyle(
                                fontSize: 13.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
