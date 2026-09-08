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
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSendResetPressed(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().sendPasswordReset(
            email: _emailController.text.trim(),
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
            icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.darkColor),
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
              } else if (state is PasswordResetEmailSent) {
                CustomSnackbar(
                  AppColors.successColor,
                  state.message,
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
                      SizedBox(height: 24.h),
                      Text(
                        AppTexts.forgotPasswordTitle,
                        style: getBoldStyle(
                          fontSize: 20.sp,
                          color: AppColors.darkColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        AppTexts.forgotPasswordSubtitle,
                        textAlign: TextAlign.center,
                        style: getRegularStyle(
                          fontSize: 13.sp,
                          color: AppColors.grey2,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      AuthTextField(
                        label: AppTexts.emailLabel,
                        hintText: AppTexts.emailHint,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppTexts.pleaseEnterEmail;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 28.h),
                      PrimaryButton(
                        text: AppTexts.sendResetLink,
                        isLoading: state is AuthLoading,
                        onPressed: () => _onSendResetPressed(context),
                      ),
                      SizedBox(height: 24.h),
                      GestureDetector(
                        onTap: () => context.router.maybePop(),
                        child: Text(
                          AppTexts.backToLogin,
                          style: getBoldStyle(
                            fontSize: 13.sp,
                            color: AppColors.primaryColor,
                          ),
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
