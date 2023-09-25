import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/Account%20Tab/ViewModel/profile_states.dart';
import 'package:vcare/Features/History%20Tab/ViewModel/history_cubit.dart';

import '../../../History Tab/View/Components/appoiintmet_details_dialog.dart';
import '../../../History Tab/ViewModel/history_states.dart';
import '../../../History Tab/ViewMoudel/cubit/history_cubit.dart';
import '../../ViewModel/profile_cubit.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (context) => ProfileCubit()..getProfile(),
          child: BlocConsumer<ProfileCubit, ProfileStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProfileLoadingState) {
                return CircularProgressIndicator();
              } else if (state is ProfileFailState) {
                return Text(state.message ?? '');
              } else if (state is ProfileSuccessState) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Icon(
                        Icons.account_circle_outlined,
                        size: 50,
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          state.profileResponse.data?[0].name ?? "",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Center(
                        child: TextButton.icon(
                          label: Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                          icon: const Text('Edit Account Details',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                          onPressed: () {},
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.email_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text(state.profileResponse.data?[0].email ?? "",
                              style: TextStyle(fontSize: 18))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(
                            width: 10,
                          ),
                          Text(state.profileResponse.data?[0].phone ?? "",
                              style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.lock_outline),
                          SizedBox(
                            width: 10,
                          ),
                          Text('ºººººººººº', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
        Expanded(
          child: BlocProvider<HistoryCubit>(
            create: (context) => HistoryCubit()..getAllAppointments(),
            child: BlocConsumer<HistoryCubit, HistoryState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is HistoryInitial) {
                  return CircularProgressIndicator();
                } else if (state is GetAllAppointmentsErrorState) {
                  return Text('');
                } else if (state is GetAllAppointmentsSuccessState) {
                  var cupit = HistoryCubit.get(context);
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('History', style: TextStyle(fontSize: 24)),
                        Container(
                          height: 1,
                          width: 55,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap:  () {
                                  appointmentDetailsDialog(context: context, cupit: HistoryCubit(), index: index);
                                },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all()),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cupit.allAppointments[index].appointmentTime
                                                  ??
                                              "",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                            cupit.allAppointments[index].status ??
                                                '',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 19,
                                  ),
                              itemCount: 10),
                        )
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        )
      ],
    );
  }
}

