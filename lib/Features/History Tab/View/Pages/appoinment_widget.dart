import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/History%20Tab/View/Components/appointment_card.dart';
import 'package:vcare/Features/History%20Tab/ViewMoudel/cubit/history_cubit.dart';
import 'package:vcare/Features/Home%20Tab/ViewModel/Cubit/home_cubit.dart';

import '../Components/appoiintmet_details_dialog.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit()..getAllAppointments(),
      child: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cupit = HistoryCubit.get(context);
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  appointmentDetailsDialog(index:index,context: context,cupit: cupit);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all()
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(cupit.allAppointments[index].appointmentTime??""),
                      Text(cupit.allAppointments[index].status??"")
                    ],
                  ),
                ),
              ),

              separatorBuilder: (context, index) => const SizedBox(height: 10,),
              itemCount: cupit.allAppointments.length);
        },
      ),
    );
  }
}
