import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare/Core/general_components/main_button.dart';
import 'package:vcare/Features/details_screen/ViewModel/make_appointment_cubit.dart';

import '../../../../Core/ColorHelper.dart';
import '../../../History Tab/Model/Appointment.dart';
import '../../../History Tab/Model/Appointment.dart';
import '../../../History Tab/Model/Appointment.dart';
import '../../../Home Screen/View/Pages/homeScreen.dart';
import '../../../Home Tab/View/Pages/home_tab.dart';
import '../../ViewModel/make_appointment_states.dart';
import '../components/dialog.dart';

class DetailsPage extends StatelessWidget {
  static const String routeName = 'details_page';
   DetailsPage({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHelper.mainColor,
      ),
        body: DetailsScreenBody(
      controller: TextEditingController(),
    ));
  }
}

class DetailsScreenBody extends StatelessWidget {
   DetailsScreenBody({super.key, required this.controller});
  final TextEditingController controller;
  TextEditingController noteController = TextEditingController();
  var timeController = TextEditingController();
   var bookAppointmentCubit = MakeAppointmentCubit();
   final formKey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    Arrgs arrgs = ModalRoute.of(context)!.settings.arguments as Arrgs;

    print(controller.text);
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              height: 0.3.sh,
              width: double.infinity,
              color: ColorHelper.mainColor,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: arrgs.doctor?[arrgs.doctorIndex??0].photo??'',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(arrgs.doctor?[arrgs.doctorIndex??0].name??'',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w400,
                        color: ColorHelper.mainColor,
                      )),
                  Text(
                    arrgs.doctor?[arrgs.doctorIndex??0].description??'',
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
                  TextFormField(
                    controller: controller,
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Please Enter Date';
                      }
                    },
                    onTap: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2030),
                      );
                      if (selectedDate != null) {
                        final formattedDate =
                            '${selectedDate.year.toString()}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';
                        controller.text = formattedDate;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: controller.text.isEmpty ? 'yy/mm/dd' : controller.text,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 21,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                 // buildShowTextFiled(context),
                  SizedBox(
                    height: 16.h,
                  ),
                  _textInfo(text: 'Select time'),
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Please Enter Time';
                      }
                    },
                    controller: timeController,
                    onTap: () async {
                      final selectedDate = await showTimePicker(
                        initialEntryMode: TimePickerEntryMode.dial,
                        context: context,
                        initialTime: TimeOfDay.now(),
                        cancelText:  "Cancel",
                        confirmText:  "Save",
                        helpText:"Select time",
                        builder: (context, Widget? child) {
                          return MediaQuery(
                            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                            child: child!,
                          );
                        },
                      );
                      if (selectedDate != null) {
                        final formattedDate =
                            '${selectedDate.hour.toString()}:${selectedDate.minute.toString().padLeft(2, '0')}';
                        timeController.text = formattedDate;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: controller.text.isEmpty ? 'Hour/Minutes' : timeController.text,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 21,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    controller: noteController,
                    decoration: InputDecoration(
                        label: Text('Add Note',style: TextStyle(
                          color: ColorHelper.mainColor
                        ),)
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  buildConsumerBookButton(context: context,arrgs: arrgs)


                  ],
              ),
            )
          ],
        ),
      ),
    );
  }


Widget buildConsumerBookButton({
   required BuildContext context,
  required Arrgs arrgs,
  //required MakeAppointmentCubit cubit,
  }){
     return BlocConsumer<MakeAppointmentCubit, MakeAppointmentStates>(
       bloc: bookAppointmentCubit,
       listenWhen: (previous, current) {
         if (previous is MakeAppointmentLoadingState) {
           DialogUtilities.hideDialog(context);
         }
         if (current is MakeAppointmentSuccessState ||
             current is MakeAppointmentLoadingState ||
             current is MakeAppointmentFailState) {
           return true;
         }
         return false;
       },
       buildWhen: (previous, current) {
         if (current is MakeAppointmentInitialState) return true;
         return false;
       },
       listener: (context, state) {
         // event
         if (state is MakeAppointmentFailState) {
           // show message
           DialogUtilities.showMessage(
               context,
               state.message??"",
               posstiveActionName: "ok");
         }
         else if (state is MakeAppointmentLoadingState) {
           //show loading...
           DialogUtilities.showLoadingDialog(
               context,
               "Loading...");
         }
         else if (state is MakeAppointmentSuccessState) {
           if (state.bookAppointmentResponse.status == true) {

             DialogUtilities.showMessage(context, "Booked Successfully",
                 posstiveActionName: "ok", posstiveAction: () async {
                   Navigator.of(context,rootNavigator: true)
                       .pushReplacementNamed(HomeScreen.routeName);
                 });
           } else if (state.bookAppointmentResponse.status == false) {
             DialogUtilities.showMessage(
               context,
               " ${state.bookAppointmentResponse.message}",
               posstiveActionName: state.bookAppointmentResponse.message,
             );
           }
           // show dialog
           // navigate to home screen
         }
       },
       builder: (context, state){
         print('$state ddddd');
         return   MainButton(
           text: 'Book an appointment',
           onTap: () {
             bookAppointment(
                 doctorId:  arrgs.doctor?[arrgs.doctorIndex??0].id??-1,
                 startTime: timeController.text,
                 note: noteController.text
             );
           },
         );
       },
     );
}

void bookAppointment({required int doctorId,required String startTime,String? note}){
  if (formKey.currentState?.validate() == false) {
    return;
  }
  bookAppointmentCubit.makeAppointment(doctorId: doctorId, startTime: startTime,note: note);
}



  Text _textInfo({required String text}) {
    return Text(text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: ColorHelper.mainColor,
        ));
  }

}
