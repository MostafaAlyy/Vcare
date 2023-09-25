import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Core/general_components/main_button.dart';
import 'package:vcare/Features/Doctors%20Tab/view_model/get_all_doctors_cubit/get_all_doctors_cubit.dart';

import '../widget/Build_Filter_Bottom_Sheet.dart';

class DoctorsTab extends StatelessWidget {
  const DoctorsTab({super.key});

  final String imgUrl =
      'https://www.reuters.com/resizer/O-QT-6JbJVpU9G3EnvL_xPDI5S0=/960x1200/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/7NBXJ3TU5JL7NHRRJJDS3U3WDY.jpg';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllDoctorsCubit()..getAllDoctors(),
      child: BlocConsumer<GetAllDoctorsCubit, GetAllDoctorsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cupit = GetAllDoctorsCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildFilterContainer(context),
                SizedBox(height: 12.h),
                buildDoctorsGridView(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildFilterContainer(context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => const BuildFilterBottomSheet(),
        );
      },
      child: Container(
        height: 40.h,
        width: 120.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorHelper.mainColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.filter_alt_outlined, color: Color(0xffF3FAF9)),
            Text(
              'Filter',
              style: TextStyle(
                color: const Color(0xffF3FAF9),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDoctorsGridView() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 5,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 6,
        itemBuilder: (ctx, index) {
          return buildDoctorItem();
        },
      ),
    );
  }

  Widget buildDoctorItem() {
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
          buildDoctorImage(imgUrl),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 5.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'doctor',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                Text(
                  'doctors.description!',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(3.r),
            child: buildMoreDetailsTextButton(),
          ),
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
}
