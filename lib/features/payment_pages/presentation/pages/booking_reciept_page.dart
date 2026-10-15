import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/constant/custom_app_bar.dart';
import 'package:real_estate/core/di.dart';
import 'package:real_estate/features/home/presentation/screens/home_view.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/custom_button_widget.dart';

// Extracted Widgets
import 'package:real_estate/features/payment_pages/presentation/widgets/receipt_header_widget.dart';
import 'package:real_estate/features/payment_pages/presentation/widgets/receipt_row_details_widget.dart';

import 'package:real_estate/features/profile_page/presentation/cubit/profile_page_cubit.dart';

class BookingReceiptPage extends StatelessWidget {
  final double totalAmount;
  final double basePrice;
  final double serviceFee;
  final String paymentMethod;
  final String propertyName;
  final String appointmentDate;

  const BookingReceiptPage({
    super.key,
    required this.totalAmount,
    required this.basePrice,
    required this.serviceFee,
    required this.paymentMethod,
    required this.propertyName,
    required this.appointmentDate,
  });

  @override
  Widget build(BuildContext context) {
    // Note: If you run into the same "_dependents.isEmpty" red screen error here,
    // change this to BlocProvider.value(value: getIt<ProfilePageCubit>()..getDataOfUser())
    return BlocProvider<ProfilePageCubit>(
      create: (context) => getIt<ProfilePageCubit>()..getDataOfUser(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "Booking Receipt"),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            children: [
              ReceiptHeaderWidget(totalAmount: totalAmount),
              SizedBox(height: 32.h),

              Divider(color: Colors.grey.shade200, thickness: 1.h),
              SizedBox(height: 16.h),

              const ReceiptDetailRowWidget(
                label: "Account Number",
                value: "2618085752257",
              ),
              const ReceiptDetailRowWidget(
                label: "Payment Date",
                value: "Sept 9, 2025, 09:41:13",
              ),
              ReceiptDetailRowWidget(
                label: "Payment Method",
                value: paymentMethod,
              ),

              // ADDED TYPE DEFINITION HERE
              BlocBuilder<ProfilePageCubit, ProfilePageState>(
                builder: (BuildContext context, state) {
                  // Catch initial state too, just in case
                  if (state is ProfilePageIntialState ||
                      state is ProfilePageLoadingState) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is GetDataSuccessfulyState) {
                    return ReceiptDetailRowWidget(
                      label: "Sender Name",
                      value: state.dataOfUser.full_name,
                    );
                  } else if (state is FailGetDataState) {
                    return Text(
                      "Data Fetch Failed: ${state.errorMessege}", // matched your spelling
                      style: const TextStyle(color: Colors.red),
                    );
                  }
                  return Text("Unknown state: ${state.runtimeType}");
                },
              ),

              SizedBox(height: 8.h),
              Divider(color: Colors.grey.shade200, thickness: 1.h),
              SizedBox(height: 16.h),

              ReceiptDetailRowWidget(
                label: "House Prices",
                value: "\$${basePrice.toStringAsFixed(3)}",
              ),
              ReceiptDetailRowWidget(
                label: "HabiSpace service fee",
                value: "\$${serviceFee.toInt()}",
              ),

              SizedBox(height: 8.h),
              Divider(color: Colors.grey.shade200, thickness: 1.h),
              SizedBox(height: 16.h),

              ReceiptDetailRowWidget(label: "Real Estate", value: propertyName),
              ReceiptDetailRowWidget(
                label: "Book Appointment",
                value: appointmentDate,
              ),

              SizedBox(height: 40.h),
              CustomButtonWidget(
                title: "Done",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
