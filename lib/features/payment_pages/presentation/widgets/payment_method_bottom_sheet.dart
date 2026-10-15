import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class PaymentMethodBottomSheet {
  // We pass the currentMethod to show the checkmark, and a callback to return the new selection
  static void show({
    required BuildContext context,
    required String currentMethod,
    required Function(String title, IconData icon) onMethodSelected,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.w).copyWith(bottom: 32.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Payment Method",
                style: getBoldStyle(fontSize: 18.sp, color: Colors.black),
              ),
              SizedBox(height: 16.h),
              _buildPaymentOption(
                context,
                Icons.credit_card,
                "Credit Card",
                currentMethod,
                onMethodSelected,
              ),
              _buildPaymentOption(
                context,
                Icons.account_balance,
                "Bank Transfer",
                currentMethod,
                onMethodSelected,
              ),
              _buildPaymentOption(
                context,
                Icons.phone_android,
                "Mobile Banking",
                currentMethod,
                onMethodSelected,
              ),
              _buildPaymentOption(
                context,
                Icons.account_balance_wallet,
                "E-Wallet",
                currentMethod,
                onMethodSelected,
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildPaymentOption(
    BuildContext context,
    IconData icon,
    String title,
    String currentMethod,
    Function(String title, IconData icon) onMethodSelected,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(
        title,
        style: getRegularStyle(fontSize: 14.sp, color: Colors.black),
      ),
      trailing: currentMethod == title
          ? const Icon(Icons.check_circle, color: AppColors.primaryColor)
          : null,
      onTap: () {
        // 1. Pass the selected data back to the main screen
        onMethodSelected(title, icon);
        // 2. Close the bottom sheet
        Navigator.pop(context);
      },
    );
  }
}
