import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/constant/custom_logo.dart';
import '../../../../core/constant/snakbar.dart';
import '../../../../core/di.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/app_texts.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_login_button.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().login(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
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
                  'Logged in successfully',
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
                      SizedBox(height: 20.h),
                      const CustomLogo(),
                      SizedBox(height: 24.h),
                      Text(
                        AppTexts.signInAccount,
                        style: getBoldStyle(
                          fontSize: 20.sp,
                          color: AppColors.darkColor,
                        ),
                      ),
                      SizedBox(height: 32.h),
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
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppTexts.pleaseEnterPassword;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            context.pushRoute(const ForgotPasswordRoute());
                          },
                          child: Text(
                            AppTexts.forgotPassword,
                            style: getMediumStyle(
                              fontSize: 13.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      PrimaryButton(
                        text: AppTexts.loginButton,
                        isLoading: state is AuthLoading,
                        onPressed: () => _onLoginPressed(context),
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: AppColors.bordergrey),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              AppTexts.orLoginWith,
                              style: getRegularStyle(
                                fontSize: 12.sp,
                                color: AppColors.grey2,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: AppColors.bordergrey),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      SocialLoginButton(
                        text: AppTexts.continueWithGoogle,
                        iconPath: AppAssets.googleIcon,
                        onPressed: () {
                          CustomSnackbar(
                            AppColors.infoColor,
                            'Google Sign In clicked',
                            false,
                          ).show(context);
                        },
                      ),
                      SizedBox(height: 12.h),
                      SocialLoginButton(
                        text: AppTexts.continueWithApple,
                        iconPath: AppAssets.appleIcon,
                        backgroundColor: AppColors.appleBtnBackground,
                        textColor: AppColors.white,
                        onPressed: () {
                          CustomSnackbar(
                            AppColors.infoColor,
                            'Apple Sign In clicked',
                            false,
                          ).show(context);
                        },
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppTexts.dontHaveAccount,
                            style: getRegularStyle(
                              fontSize: 13.sp,
                              color: AppColors.darkColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushRoute(const SignUpRoute());
                            },
                            child: Text(
                              AppTexts.signUpLink,
                              style: getBoldStyle(
                                fontSize: 13.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: getRegularStyle(
                            fontSize: 11.sp,
                            color: AppColors.grey2,
                          ),
                          children: [
                            const TextSpan(text: AppTexts.bySigningInPrefix),
                            TextSpan(
                              text: AppTexts.termsAndConditions,
                              style: getMediumStyle(
                                fontSize: 11.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const TextSpan(text: AppTexts.learnHowWeUsePrefix),
                            TextSpan(
                              text: AppTexts.privacyPolicy,
                              style: getMediumStyle(
                                fontSize: 11.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
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
