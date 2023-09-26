import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/ColorHelper.dart';
import '../../../Home Tab/Model/Doctors.dart';

Widget buildDoctorsGridView(List<Doctors> doctor) {
  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 6 / 7,
        crossAxisSpacing: 2,
        mainAxisSpacing: 4,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: doctor.length,
      itemBuilder: (ctx, index) {
        return buildDoctorItem(doctor[index]);
      },
    ),
  );
}

Widget buildDoctorItem(Doctors doctor) {
  return Container(
    // height: 150.h,
    // width: 145.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11),
      border: Border.all(color: Colors.black),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDoctorImage(doctor.photo!),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 5.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name!,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis),
              ),
              Text(
                doctor.description!,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
        buildMoreDetailsTextButton(),
      ],
    ),
  );
}

Widget buildDoctorImage(String photo) {
  return Container(
    height: 100.h,
    width: double.infinity,
    decoration: BoxDecoration(
      color: ColorHelper.mainColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: FancyShimmerImage(
        width: double.infinity,
        errorWidget: const Icon(Icons.error),
        imageUrl: photo,
        boxFit: BoxFit.fill,
      ),
    ),
  );
}

Widget buildMoreDetailsTextButton({VoidCallback? onPressed}) {
  return TextButton.icon(
    onPressed: onPressed,
    icon: const Text('More Details'),
    label: const Icon(Icons.arrow_right_alt_rounded),
  );
}