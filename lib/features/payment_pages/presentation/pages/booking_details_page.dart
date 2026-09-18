import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/constant/custom_app_bar.dart';
import 'package:real_estate/core/di.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import 'package:real_estate/core/utils/app_styles.dart';

import 'package:real_estate/features/payment_pages/presentation/widgets/add_on_card.widget.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/card_input_widget.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/custom_button_widget.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/payment_method_bottom_sheet.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/payment_method_widget.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/price_details_widget.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/property_widget.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/resident_data_wdget.dart';

import 'package:real_estate/features/profile_page/presentation/cubit/profile_page_cubit.dart';

class BookingDetailsPage extends StatefulWidget {
  final int propertyId;
  final String propertyTitle;
  final String propertyImageUrl;
  final double propertyPrice;
  final String propertyLocation;
  final double rating;
  const BookingDetailsPage({
    super.key,
    required this.propertyId,
    required this.propertyTitle,
    required this.propertyImageUrl,
    required this.propertyPrice,
    required this.propertyLocation,
    required this.rating,
  });

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  late double _currentTotal;
  bool _isTrashMoneySelected = false;
  // Payment Method State
  String _selectedPaymentMethod = "Bank Transfer";
  IconData _selectedPaymentIcon = Icons.account_balance;

  @override
  void initState() {
    super.initState();
    // 2. Set the initial total to the base price passed from the previous screen
    _currentTotal = widget.propertyPrice;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilePageCubit>(
      create: (context) =>
          getIt<ProfilePageCubit>()..getDataOfUser(), // ✅ Correct
      child: Scaffold(
        appBar: CustomAppBar(title: "Booking Detail"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PropertyWidget(
                propertyImageUrl: widget.propertyImageUrl,
                propertyTitle: widget.propertyTitle,
                propertyLocation: widget.propertyLocation,
                rating: widget.rating,
              ),
              ResidentDataWidget(),
              SizedBox(height: 5.h),
              AddOnCardWidget(
                icon: Icons.delete,
                title: "Trash Money",
                price: "Rp 30.000/month",
                // Change color if selected to give the user visual feedback!
                color: _isTrashMoneySelected
                    ? AppColors.primaryColor
                    : AppColors.grey,
                onTap: () {
                  // 3. Update the state inside setState so the UI rebuilds
                  setState(() {
                    _isTrashMoneySelected = !_isTrashMoneySelected;
                    if (_isTrashMoneySelected) {
                      _currentTotal += 30;
                    } else {
                      _currentTotal -= 30; // Remove it if they tap again
                    }
                  });
                },
              ),
              SizedBox(height: 5.h),
             Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PaymentMethodWidget(
                      selectedMethod: _selectedPaymentMethod,
                      icon: _selectedPaymentIcon,
                      onTap: () {
                        PaymentMethodBottomSheet.show(
                          context: context,
                          currentMethod: _selectedPaymentMethod,
                          onMethodSelected: (String newTitle, IconData newIcon) {
                            setState(() {
                              _selectedPaymentMethod = newTitle;
                              _selectedPaymentIcon = newIcon;
                            });
                          },
                        );
                      },
                    ),
                    SizedBox(height: 24.h),
                     PriceDetailsWidgets(
                propertyPrice: _currentTotal,

              ),
                    SizedBox(height: 24.h),
                    
                    // Passes the selected method to dynamically change the form
                    CardInputWidget(selectedMethod: _selectedPaymentMethod),
                    
                    
                  ],
                ),
              ),
              PriceDetailsWidgets(
                propertyPrice: _currentTotal,

              ),
              
              CustomButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
