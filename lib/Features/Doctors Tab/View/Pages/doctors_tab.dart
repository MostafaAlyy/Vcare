import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Core/general_components/CustomCircularProgressIndicator.dart';
import 'package:vcare/Core/general_components/main_button.dart';
import 'package:vcare/Features/Doctors%20Tab/view_model/get_all_city_cubit/get_all_city_cubit.dart';
import 'package:vcare/Features/Doctors%20Tab/view_model/get_all_doctors_cubit/get_all_doctors_cubit.dart';
import '../../../History Tab/Model/Appointment.dart';
import '../widget/doctors_grid_view.dart';

class DoctorsTab extends StatefulWidget {
  const DoctorsTab({super.key});

  @override
  State<DoctorsTab> createState() => _DoctorsTabState();
}

class _DoctorsTabState extends State<DoctorsTab> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllDoctorsCubit()..getAllDoctors(),
      child: BlocConsumer<GetAllDoctorsCubit, GetAllDoctorsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<GetAllDoctorsCubit>(context);
          if (state is GetAllDoctorsSuccess) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildFilterContainer(context, cubit),
                  SizedBox(height: 12.h),
                  buildDoctorsGridView(state.doctors),
                ],
              ),
            );
          }
          if (state is GetFilterDoctorsSuccess) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildFilterContainer(context, cubit),
                  SizedBox(height: 12.h),
                  buildDoctorsGridView(state.filterDoctors),
                ],
              ),
            );
          } else if (state is GetAllDoctorsLoading) {
            return const Center(child: CustomCircularProgressIndicator());
          } else if (state is GetAllDoctorsError) {
            return const Text('Error');
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildFilterContainer(context, GetAllDoctorsCubit cubit) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          constraints: BoxConstraints(maxHeight: 0.6.sh),
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return BlocProvider(
              create: (context) => GetAllCityCubit()..getAllCity(),
              child: BlocBuilder<GetAllCityCubit, GetAllCityState>(
                builder: (context, state) {
                  var cupitCity = GetAllCityCubit.get(context);

                  return ConditionalBuilder(
                      condition: cupitCity.cities.isEmpty,
                      builder: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                      fallback: (context) {
                        return Container(
                          color: const Color(0xff757575),
                          child: Container(
                            padding: EdgeInsets.all(20.r),
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
                                buildFilterByCityNameListView(
                                    cupitCity.cities, cupitCity),
                                SizedBox(height: 16.h),
                                buildFilterNameRow('GOVERNORATE'),
                                SizedBox(height: 16.h),
                                buildFilterNameRow('SPECIALIZATION'),
                                SizedBox(height: 16.h),
                                MainButton(
                                  text: 'APPLY',
                                  onTap: () {
                                    cubit.filterDoctorByCityName(
                                        cupitCity.initCityValue.id!);
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            );
          },
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

  Widget buildFilterByCityNameListView(
      List<City> cities, GetAllCityCubit cupit) {
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: cities.length,
          itemBuilder: (context, index) =>
              buildRadioButton(cities[index], cupit)),
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

  Widget buildRadioButton(City city, GetAllCityCubit cupit) {
    return Row(
      children: [
        Radio<City?>(
          value: city,
          activeColor: ColorHelper.mainColor,
          groupValue: cupit.initCityValue,
          onChanged: (value) {
            cupit.changeSelectedCity(city);
            print(cupit.initCityValue.name);
          },
        ),
        Text(city.name!),
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
        const ImageIcon(
          AssetImage('assets/Icons/minus.png'),
        ),
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
