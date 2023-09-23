import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/Core/general_components/main_button.dart';

import '../../../../Core/ColorHelper.dart';

class DetailsPage extends StatelessWidget {
  static const String routeName = 'details_page';
  const DetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: DetailsScreenBody(
        controller: TextEditingController(),
      )),
    );
  }
}

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    print(controller.text);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 0.3.sh,
            width: double.infinity,
            color: ColorHelper.mainColor,
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Doctor Name',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w400,
                      color: ColorHelper.mainColor,
                    )),
                Text(
                  'Doctor description here and summary\n about everything they did and who they are\n etc.. lorem ipsum lorem ipsum lorem ipsum lorem ipsum.',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorHelper.mainColor,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade500,
                ),
                SizedBox(
                  height: 8.h,
                ),
                _textInfo(text: 'Select date'),
                buildShowTextFiled(context),
                SizedBox(
                  height: 16.h,
                ),
                _textInfo(text: 'Select time'),
                SizedBox(
                  height: 16.h,
                ),
                const Row(
                  //sp
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ChoseTimeWidget(),
                    ChoseTimeWidget(),
                    ChoseTimeWidget(),
                    ChoseTimeWidget(),
                  ],
                ),
                SizedBox(
                  height: 22.h,
                ),
                MainButton(
                  text: 'Book an appointment',
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildShowTextFiled(BuildContext context) {
    return showTextFiled(
      context,
      () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2023),
          lastDate: DateTime(2030),
        );
        if (selectedDate != null) {
          final formattedDate =
              '${selectedDate.year.toString().substring(2)}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.day.toString().padLeft(2, '0')}';
          controller.text = formattedDate;
        }
      },
    );
  }

  Text _textInfo({required String text}) {
    return Text(text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: ColorHelper.mainColor,
        ));
  }

  Widget showTextFiled(BuildContext context, VoidCallback onTap) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: controller.text.isEmpty ? 'yy/mm//dd' : controller.text,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 21,
          color: Color(0xff030E19),
        ),
      ),
    );
  }
}

class ChoseTimeWidget extends StatelessWidget {
  const ChoseTimeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.r, vertical: 8.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: ColorHelper.mainColor),
      child: Text(
        '9:00',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
