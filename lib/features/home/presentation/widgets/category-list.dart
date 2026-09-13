import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/core/utils/app_colors.dart';
import '../cubit/home_cubit.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  final List<String> categories = const ['All', 'Rent', 'Buy', 'House', 'Apartment', 'Villa'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final cubit = context.watch<HomeCubit>();
          
          bool isSelected = false;
          if (category == 'All') {
            isSelected = cubit.selectedCategory == 'All' && cubit.selectedStatus == 'All';
          } else if (category == 'Rent') {
            isSelected = cubit.selectedStatus == 'For Rent';
          } else if (category == 'Buy') {
            isSelected = cubit.selectedStatus == 'For Sale';
          } else {
            isSelected = cubit.selectedCategory == category;
          }

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(category),
              selected: isSelected,
              showCheckmark: false,
              selectedColor: AppColors.primaryColor,
              labelStyle: TextStyle(
                color: isSelected ? AppColors.lightGrey : AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
              backgroundColor: isSelected ? AppColors.primaryColor : AppColors.lightPrimaryColor,
              onSelected: (selected) {
                if (category == 'All') {
                  cubit.fetchProperties(category: 'All');
                } else if (category == 'Rent' || category == 'Buy') {
                  cubit.fetchProperties(status: category == 'Rent' ? 'For Rent' : 'For Sale');
                } else {
                  cubit.fetchProperties(category: category);
                }
              },
            ),
          );
        },
      ),
    );
  }
}