import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/ColorHelper.dart';
import '../../../../Core/general_components/main_button.dart';

class BuildFilterBottomSheet extends StatefulWidget {
  const BuildFilterBottomSheet({super.key});

  @override
  State<BuildFilterBottomSheet> createState() => _BuildFilterBottomSheetState();
}

class _BuildFilterBottomSheetState extends State<BuildFilterBottomSheet> {
  String? selectedOption = 'city';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFilterText(),
            SizedBox(height: 20.h),
            buildCityRow(),
            buildRadioButton(),
            buildRadioButton(),
            buildRadioButton(),
            buildRadioButton(),
            SizedBox(height: 20.h),
            buildFilterNameRow('GOVERNORATE'),
            SizedBox(height: 20.h),
            buildFilterNameRow('SPECIALIZATION'),
            const Spacer(),
            MainButton(text: 'APPLY', onTap: () {})
          ],
        ),
      ),
    );
  }

  Widget buildFilterNameRow(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Icon(Icons.add)
      ],
    );
  }

  Widget buildRadioButton() {
    return Row(
      children: [
        Radio(
          value: 'City 1',
          activeColor: ColorHelper.mainColor,
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),
        const Text('City 1'),
      ],
    );
  }

  Widget buildCityRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'City',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Text(
          'clear',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 8.w),
        const Icon(Icons.minimize)
      ],
    );
  }

  Widget buildFilterText() {
    return Row(
      children: [
        const Icon(Icons.filter_alt_outlined, color: ColorHelper.mainColor),
        Text(
          'Filter',
          style: TextStyle(
            color: ColorHelper.mainColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
