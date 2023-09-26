import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/Home%20Tab/View/Pages/view_more.dart';
import 'package:vcare/Features/Home%20Tab/ViewModel/Cubit/home_states.dart';
import 'package:vcare/Features/details_screen/Model/Doctor.dart';

import '../../../details_screen/view/pages/details_view.dart';
import '../../Model/Doctors.dart';
import '../../ViewModel/Cubit/home_cubit.dart';
import '../component/doctor_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cupit = HomeCubit.get(context);
          if (state is HomeSuccessState) {
            return RefreshIndicator(
              color: ColorHelper.mainColor,
              onRefresh: () {
                return cupit.getData();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Expanded(
                      // height: double.infinity,
                      // width: double.infinity,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, majorIndex) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.homeTabResponse.data?[majorIndex]
                                            .name ??
                                        '',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pushNamed(ViewMore.routeName,
                                              arguments: ViewMoreArgs(
                                                  id: state
                                                          .homeTabResponse
                                                          .data![majorIndex]
                                                          .id ??
                                                      -1,
                                                  specialization: state
                                                          .homeTabResponse
                                                          .data?[majorIndex]
                                                          .name ??
                                                      ''));
                                    },
                                    icon: const Text('More Details'),
                                    label: const Icon(
                                        Icons.arrow_right_alt_rounded),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 240,
                                width: double.infinity,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 10,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.homeTabResponse
                                          .data?[majorIndex].doctors?.length ??
                                      0,
                                  itemBuilder: (context, doctorsIndex) {
                                    return DoctorCard(
                                      imagePath: state
                                          .homeTabResponse
                                          .data![majorIndex]
                                          .doctors![doctorsIndex]
                                          .photo!,
                                      doctorName: state
                                              .homeTabResponse
                                              .data?[majorIndex]
                                              .doctors?[doctorsIndex]
                                              .name ??
                                          '',
                                      degree: state
                                              .homeTabResponse
                                              .data?[majorIndex]
                                              .doctors?[doctorsIndex]
                                              .degree ??
                                          '',
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pushNamed(DetailsPage.routeName,
                                                arguments: Arrgs(
                                                    majorIndex: majorIndex,
                                                    doctorIndex: doctorsIndex,
                                                    doctor: state
                                                            .homeTabResponse
                                                            .data![majorIndex]
                                                            .doctors ??
                                                        []));
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: state.homeTabResponse.data?.length ?? 0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeErrorState) {
            return Text(state.message ?? '');
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class Arrgs {
  int? id;
  int? doctorIndex;
  int? majorIndex;
  List<Doctors>? doctor;
  Doctors? doctors;

  Arrgs(
      {this.majorIndex, this.doctorIndex, this.doctor, this.doctors, this.id});
}

class ViewMoreArgs {
  int id;
  String specialization;
  ViewMoreArgs({required this.id, required this.specialization});
}
