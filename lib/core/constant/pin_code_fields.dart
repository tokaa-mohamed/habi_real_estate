import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/app_colors.dart';

class PinCodeFields extends StatefulWidget {
  final int length;
  final Function(String) onChanged;
  final Function(String) onCompleted;
  final bool enabled;
  final TextStyle? textStyle;

  const PinCodeFields({
    super.key,
    this.length = 6,
    required this.onChanged,
    required this.onCompleted,
    this.enabled = true,
    this.textStyle,
  });

  @override
  State<PinCodeFields> createState() => _PinCodeFieldsState();
}

class _PinCodeFieldsState extends State<PinCodeFields> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: widget.length,
      controller: _controller,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      onCompleted: widget.onCompleted,
      keyboardType: TextInputType.number,
      autoFocus: true,
      textStyle: widget.textStyle,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 56,
        fieldWidth: 48,
        activeColor: AppColors.primaryColor,
        selectedColor: AppColors.primaryColor,
        inactiveColor: AppColors.bordergrey,
        activeFillColor: AppColors.inputFieldFill,
        selectedFillColor: AppColors.white,
        inactiveFillColor: AppColors.inputFieldFill,
      ),
    );
  }
}
