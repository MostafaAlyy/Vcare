import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/History%20Tab/View/Components/appoiintmet_details_dialog.dart';
import 'package:vcare/Features/History%20Tab/ViewMoudel/cubit/history_cubit.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.cupit,
    required this.index,
  });

  final HistoryCubit cupit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        appointmentDetailsDialog(context: context, cupit: cupit, index: index);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorHelper.mainColor)),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: CachedNetworkImage(
                imageUrl: cupit.allAppointments[index].doctor!.photo!,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
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
                  Text('name : ${cupit.allAppointments[index].doctor!.name}'),
                  Text(
                    'date :  ${cupit.allAppointments[index].appointmentTime}',
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                      'price :  ${cupit.allAppointments[index].appointmentPrice}'),
                  Text('status :  ${cupit.allAppointments[index].status}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
