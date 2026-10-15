import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class SelectDateWidget extends StatefulWidget {
  const SelectDateWidget({super.key});

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  DateTime? _selectedDate;
  // Function to open the calendar and save the picked date
  Future<void> _pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor, // Calendar header color
              onPrimary: Colors.white, // Calendar text color
              onSurface: Colors.black, // Calendar dates color
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if the user has selected a date
    final bool hasDate = _selectedDate != null;

    // Format the date if it exists, otherwise show the hint text
    final String dateText = hasDate
        ? DateFormat('MMM dd, yyyy').format(_selectedDate!)
        : 'Choose your booking date';

    return InkWell(
      onTap: () => _pickDate(context),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dateText,
              style: getRegularStyle(
                fontSize: 10.sp,
                color: hasDate ? AppColors.grey : Colors.grey,
              ),
            ),
            // Dynamically swap the icon based on whether a date is selected
            Icon(
              hasDate ? Icons.edit : Icons.calendar_today,
              color: AppColors.primaryColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
