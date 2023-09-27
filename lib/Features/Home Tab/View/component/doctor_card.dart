import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../Core/ColorHelper.dart';

class DoctorCard extends StatelessWidget {
  DoctorCard(
      {super.key,
      required this.degree,
      required this.doctorName,
      required this.imagePath,
      required this.onTap});
  String imagePath;
  String doctorName;
  String degree;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .1,
            width: MediaQuery.of(context).size.width * .36,
            decoration: BoxDecoration(
              color: ColorHelper.mainColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imagePath,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .28,
                  child: Text(
                    doctorName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16),
                    maxLines: 1,
                  ),
                ),
                Text(
                  degree,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextButton.icon(
              onPressed: onTap,
              icon: const Text('More Details'),
              label: const Icon(Icons.arrow_right_alt_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
