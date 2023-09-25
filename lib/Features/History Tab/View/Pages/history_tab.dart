import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/ColorHelper.dart';
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
                itemBuilder: (context, index) => Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: ColorHelper.mainColor)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: CachedNetworkImage(
                              imageUrl:
                                  cupit.allAppointments[index].doctor!.photo!,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                    'name : ${cupit.allAppointments[index].doctor!.name}'),
                                Text(
                                  'date :  ${cupit.allAppointments[index].appointmentTime}',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                    'price :  ${cupit.allAppointments[index].appointmentPrice}'),
                                Text(
                                    'status :  ${cupit.allAppointments[index].status}'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: cupit.allAppointments.length),
          );
        },
      ),
    );
  }
}
