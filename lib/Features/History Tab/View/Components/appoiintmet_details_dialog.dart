import 'package:flutter/material.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/History%20Tab/ViewMoudel/cubit/history_cubit.dart';

Future appointmentDetailsDialog({
  required BuildContext context,
  required HistoryCubit cupit,
  required int index,
}) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Sign In",
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.height / 1.3,
            width: MediaQuery.of(context).size.width / 1.1,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child:
                Scaffold(body: AppointmentDetails(cupit: cupit, index: index)),
          ),
        );
      });
}

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails(
      {super.key, required this.cupit, required this.index});
  final HistoryCubit cupit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Doctor details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('name : ${cupit.allAppointments[index].doctor!.name}'),
            Text(
              'location :  ${cupit.allAppointments[index].doctor!.address}',
              overflow: TextOverflow.ellipsis,
            ),
            Text('email :  ${cupit.allAppointments[index].doctor!.email}'),
            Text('phone :  ${cupit.allAppointments[index].doctor!.phone}'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Patient details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('name : ${cupit.allAppointments[index].patient!.name}'),
            Text(
              'gender :  ${cupit.allAppointments[index].patient!.gender}',
              overflow: TextOverflow.ellipsis,
            ),
            Text('email :  ${cupit.allAppointments[index].patient!.email}'),
            Text('phone :  ${cupit.allAppointments[index].patient!.phone}'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Appointment details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('date : ${cupit.allAppointments[index].appointmentTime}'),
            Text(
              'appointment id :  ${cupit.allAppointments[index].id}',
              overflow: TextOverflow.ellipsis,
            ),
            Text('status :  ${cupit.allAppointments[index].status}'),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorHelper.mainColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(children: [
                  const Text(
                    'Total',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  Text(
                    '\$${cupit.allAppointments[index].appointmentPrice}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
