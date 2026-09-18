import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class CardInputWidget extends StatelessWidget {
  final String selectedMethod; // Add this variable

  const CardInputWidget({super.key, required this.selectedMethod});

  @override
  Widget build(BuildContext context) {
    // If they select Credit Card, show the full form
    if (selectedMethod == "Credit Card") {
      return _buildCreditCardForm();
    }
    // If they select Bank Transfer, show bank instructions
    else if (selectedMethod == "Bank Transfer") {
      return _buildPlaceholderMessage(
        title: "Bank Transfer Details",
        message:
            "You will receive a Virtual Account number to complete your transfer on the next screen.",
      );
    }
    // Default fallback for E-Wallet / Mobile Banking
    else {
      return _buildPlaceholderMessage(
        title: "$selectedMethod Details",
        message:
            "You will be redirected to your $selectedMethod app to authorize this payment.",
      );
    }
  }

  // --- The Original Credit Card Form ---
  Widget _buildCreditCardForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Details",
          style: getBoldStyle(fontSize: 16.sp, color: Colors.black),
        ),
        SizedBox(height: 8.h),
        Text(
          "Please fill out the form below. Enter your card account details.",
          style: getRegularStyle(fontSize: 12.sp, color: Colors.grey.shade500),
        ),
        SizedBox(height: 24.h),

        Text(
          "Card Number",
          style: getBoldStyle(fontSize: 14.sp, color: Colors.black),
        ),
        SizedBox(height: 8.h),
        _buildTextField(hint: "1243 _2133_ 9832_ 3200", suffixText: "VISA"),
        SizedBox(height: 16.h),

        Text(
          "Expiration Date",
          style: getBoldStyle(fontSize: 14.sp, color: Colors.black),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(child: _buildTextField(hint: "12")),
            SizedBox(width: 16.w),
            Expanded(child: _buildTextField(hint: "2026")),
          ],
        ),
        SizedBox(height: 16.h),

        Text(
          "CCV",
          style: getBoldStyle(fontSize: 14.sp, color: Colors.black),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 120.w,
          child: _buildTextField(hint: "568"),
        ),
      ],
    );
  }

  // --- Placeholder for other payment methods ---
  Widget _buildPlaceholderMessage({
    required String title,
    required String message,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getBoldStyle(fontSize: 16.sp, color: Colors.black),
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            message,
            style: getRegularStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }

  // Reusable text field builder
  Widget _buildTextField({required String hint, String? suffixText}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: getRegularStyle(fontSize: 14.sp, color: Colors.black),
          suffixIcon: suffixText != null
              ? Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Text(
                    suffixText,
                    style: getBoldStyle(
                      fontSize: 16.sp,
                      color: Colors.blue.shade800,
                    ),
                  ),
                )
              : null,
          suffixIconConstraints: suffixText != null
              ? const BoxConstraints(minWidth: 0, minHeight: 0)
              : null,
        ),
      ),
    );
  }
}
