import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/SearchTab/View/Components/doctor_search_card.dart';
import 'package:vcare/Features/SearchTab/ViewModel/cubit/search_cubit.dart';

class SearchTab extends StatelessWidget {
  SearchTab({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cupit = SearchCubit.get(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    onChanged: (text) {
                      cupit.searchDoctor(text);
                    },
                    onSubmitted: (value) {
                      cupit.searchDoctor(value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => DoctorSearchCard(
                            cupit: cupit,
                            index: index,
                          ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: cupit.searchDoctorsList.length)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
