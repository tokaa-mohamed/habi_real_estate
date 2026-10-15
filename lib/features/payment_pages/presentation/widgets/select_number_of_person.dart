import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

class GuestSelectionWidget extends StatelessWidget {
  final int currentGuests;
  final ValueChanged<int> onGuestsChanged;

  const GuestSelectionWidget({
    super.key,
    required this.currentGuests,
    required this.onGuestsChanged,
  });

  Future<void> _showGuestDialog(BuildContext context) async {
    // A temporary variable so we don't change the main screen until they hit "Save"
    int tempGuests = currentGuests;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              title: Text(
                'Number of Guests',
                style: getBoldStyle(fontSize: 10.sp, color: Colors.black),
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Minus Button
                  IconButton(
                    onPressed: tempGuests > 1
                        ? () => setDialogState(() => tempGuests--)
                        : null,
                    icon: Icon(
                      Icons.remove_circle_outline,
                      size: 32.sp,
                      color: tempGuests > 1
                          ? AppColors.primaryColor
                          : Colors.grey.shade300,
                    ),
                  ),

                  SizedBox(width: 10.w),
                  Text(
                    '$tempGuests',
                    style: getBoldStyle(fontSize: 24.sp, color: Colors.black),
                  ),
                  SizedBox(width: 10.w),

                  // Plus Button
                  IconButton(
                    onPressed: () => setDialogState(() => tempGuests++),
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 15.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      Navigator.pop(context), // Close without saving
                  child: Text(
                    'Cancel',
                    style: getRegularStyle(fontSize: 10.sp, color: Colors.grey),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    // Update the parent screen and close the dialog
                    onGuestsChanged(tempGuests);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Save',
                    style: getBoldStyle(fontSize: 10.sp, color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showGuestDialog(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$currentGuests ${currentGuests == 1 ? "Guest" : "person"}',
              style: getRegularStyle(fontSize: 12.sp, color: Colors.black),
            ),
            Icon(Icons.edit, color: AppColors.primaryColor, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
