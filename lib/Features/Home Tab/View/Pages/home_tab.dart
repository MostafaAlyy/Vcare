import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/Home%20Tab/ViewModel/Cubit/home_states.dart';

import '../../../details_screen/view/pages/details_view.dart';
import '../../Model/Doctors.dart';
import '../../ViewModel/Cubit/home_cubit.dart';

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
                                    onPressed: () {},
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
                                    return Container(
                                      height: 210,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: ColorHelper.mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              child: CachedNetworkImage(
                                                fit: BoxFit.fill,
                                                imageUrl:
                                                    "https://via.placeholder.com/640x480.png/005566?text=doctors+aliquid",
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state
                                                          .homeTabResponse
                                                          .data?[majorIndex]
                                                          .doctors?[
                                                              doctorsIndex]
                                                          .name ??
                                                      '',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  state
                                                          .homeTabResponse
                                                          .data?[majorIndex]
                                                          .doctors?[
                                                              doctorsIndex]
                                                          .degree ??
                                                      '',
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: TextButton.icon(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    DetailsPage.routeName,
                                                    arguments: Arrgs(
                                                        majorIndex: majorIndex,
                                                        doctorIndex:
                                                            doctorsIndex,
                                                        Doctor: state
                                                                .homeTabResponse
                                                                .data![
                                                                    majorIndex]
                                                                .doctors ??
                                                            []));
                                              },
                                              icon: const Text('More Details'),
                                              label: const Icon(Icons
                                                  .arrow_right_alt_rounded),
                                            ),
                                          ),
                                        ],
                                      ),
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
  int doctorIndex;
  int majorIndex;
  List<Doctors> Doctor;

  Arrgs(
      {required this.majorIndex,
      required this.doctorIndex,
      required this.Doctor,
      this.id});
}
