import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class CardInputWidget extends StatelessWidget {
  final String selectedMethod;

  const CardInputWidget({super.key, required this.selectedMethod});

  @override
  Widget build(BuildContext context) {
    if (selectedMethod == "Credit Card") {
      return _buildCreditCardForm();
    } else if (selectedMethod == "Bank Transfer") {
      return _buildBankTransferForm();
    } else {
      // Handles E-Wallet and Mobile Banking
      return _buildWalletForm();
    }
  }

  // --- 1. Credit Card Form ---
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

  // --- 2. Bank Transfer Form ---
  Widget _buildBankTransferForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bank Transfer Details",
          style: getBoldStyle(fontSize: 16.sp, color: Colors.black),
        ),
        SizedBox(height: 8.h),
        Text(
          "Please enter the bank account number you will transfer from.",
          style: getRegularStyle(fontSize: 12.sp, color: Colors.grey.shade500),
        ),
        SizedBox(height: 24.h),

        Text(
          "Account Number",
          style: getBoldStyle(fontSize: 14.sp, color: Colors.black),
        ),
        SizedBox(height: 8.h),
        _buildTextField(hint: "Enter your 10-14 digit account number"),
      ],
    );
  }

  // --- 3. E-Wallet / Mobile Banking Form ---
  Widget _buildWalletForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$selectedMethod Details",
          style: getBoldStyle(fontSize: 16.sp, color: Colors.black),
        ),
        SizedBox(height: 8.h),
        Text(
          "Please enter the mobile number linked to your $selectedMethod.",
          style: getRegularStyle(fontSize: 12.sp, color: Colors.grey.shade500),
        ),
        SizedBox(height: 24.h),

        Text(
          "Mobile Number",
          style: getBoldStyle(fontSize: 14.sp, color: Colors.black),
        ),
        SizedBox(height: 8.h),
        _buildTextField(hint: "e.g. 010 1234 5678"),
      ],
    );
  }

  // --- Reusable text field builder ---
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
          hintStyle: getRegularStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade400,
          ),
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
