import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/History%20Tab/View/Components/appointment_card.dart';
import 'package:vcare/Features/History%20Tab/ViewMoudel/cubit/history_cubit.dart';
import 'package:vcare/Features/Home%20Tab/ViewModel/Cubit/home_cubit.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

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
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => AppointmentCard(
                      cupit: cupit,
                      index: index,
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: cupit.allAppointments.length),
          );
        },
      ),
    );
  }
}
