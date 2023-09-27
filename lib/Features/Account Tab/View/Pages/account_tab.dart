
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/Account%20Tab/ViewModel/profile_states.dart';
import 'package:vcare/Features/Auth/View/Pages/login.dart';
import 'package:vcare/Features/Auth/ViewModel/logout_cubit/logout_cubit.dart';
import 'package:vcare/Features/History%20Tab/View/Pages/history_tab.dart';
import 'package:vcare/Features/History%20Tab/ViewModel/history_cubit.dart';

import '../../../Auth/ViewModel/logout_cubit/logout_states.dart';
import '../../../History Tab/View/Components/appoiintmet_details_dialog.dart';
import '../../../History Tab/View/Pages/appoinment_widget.dart';
import '../../../History Tab/ViewModel/history_states.dart';
import '../../../History Tab/ViewMoudel/cubit/history_cubit.dart';
import '../../../Update Profile/View/Pages/update_profile.dart';
import '../../../details_screen/view/components/dialog.dart';
import '../../ViewModel/profile_cubit.dart';

class AccountTab extends StatelessWidget {
   AccountTab({super.key});
static const String routeName = 'profile';

var logoutCubit = LogoutCubit();
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
                          onPressed: () {
                            Navigator.of(context,rootNavigator: true).pushNamed(UpdatePage.routeName);
                          },
                        ),
                      ),
                      const Divider(color: Colors.black,),
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
                      buildLogout(logoutCubit,context),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text('History', style: TextStyle(fontSize: 24)),
              Container(
                height: 1,
                width: 55,
                color: Colors.black,
              ),
              SizedBox(height: 20,),
              Expanded(child: AppointmentWidget()),
          ],
        ),
            ))
      ],
    );
  }

  Widget buildLogout(LogoutCubit cubit,BuildContext context){
    return BlocConsumer<LogoutCubit, LogoutStates>(
      bloc: logoutCubit,
      listenWhen: (previous, current) {
        if (previous is LogoutLoadingState) {
          DialogUtilities.hideDialog(context);
        }
        if (current is LogoutSuccessState ||
            current is LogoutLoadingState ||
            current is LogoutFailState) {
          return true;
        }
        return false;
      },
      buildWhen: (previous, current) {
        if (current is LogoutInitialState) return true;
        return false;
      },
      listener: (context, state) {
        // event
        if (state is LogoutFailState) {
          // show message
          DialogUtilities.showMessage(
              context,
              state.message??"",
              posstiveActionName: "ok");
        }
        else if (state is LogoutLoadingState) {
          //show loading...
          DialogUtilities.showLoadingDialog(
              context,
              "Loading...");
        }
        else if (state is LogoutSuccessState) {
          if (state.logoutResponse.status == true) {
            final storage =  FlutterSecureStorage();
                   storage.delete(key: 'token');
            Navigator.of(context,rootNavigator: true)
                .pushReplacementNamed(LoginPage.routeName);

          } else if (state.logoutResponse.status == false) {
            DialogUtilities.showMessage(
              context,
              " ${state.logoutResponse.message}",
              posstiveActionName: state.logoutResponse.message,
            );
          }
          // show dialog
          // navigate to home screen
        }
      },
      builder: (context, state){
        return  Center(
          child: TextButton.icon(

            onPressed: (){
              logoutCubit.logout();
            },
            icon: const Text('Logout',style: TextStyle(
                color: ColorHelper.mainColor,
                fontSize: 19
            ),),
            label: const Icon(Icons.logout_outlined,color:ColorHelper.mainColor ,),

          ),

        );
      },
    );
  }
}
