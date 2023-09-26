import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/SearchTab/ViewModel/cubit/search_cubit.dart';

class DoctorSearchCard extends StatelessWidget {
  const DoctorSearchCard({
    super.key,
    required this.cupit,
    required this.index,
  });

  final SearchCubit cupit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: ColorHelper.mainColor)),
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.15,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: cupit.searchDoctorsList[index].photo!,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
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
                Text('${cupit.searchDoctorsList[index].name}'),
                Text(
                  ' ${cupit.searchDoctorsList[index].degree}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
