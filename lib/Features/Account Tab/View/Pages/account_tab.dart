import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/Account%20Tab/ViewModel/profile_states.dart';
import 'package:vcare/Features/History%20Tab/View/Pages/history_tab.dart';
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
                return const CircularProgressIndicator();
              } else if (state is ProfileFailState) {
                return Text(state.message ?? '');
              } else if (state is ProfileSuccessState) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                          child: Icon(
                        Icons.account_circle_outlined,
                        size: 50,
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          state.profileResponse.data?[0].name ?? "",
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      Center(
                        child: TextButton.icon(
                          label: const Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                          icon: const Text('Edit Account Details',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                          onPressed: () {},
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.email_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(state.profileResponse.data?[0].email ?? "",
                              style: const TextStyle(fontSize: 18))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.phone),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(state.profileResponse.data?[0].phone ?? "",
                              style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
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
        const Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('   History', style: TextStyle(fontSize: 24)),
            Divider(),
            Expanded(child: HistoryTab()),
          ],
        ))
      ],
    );
  }
}
