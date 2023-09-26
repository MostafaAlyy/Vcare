import 'package:flutter/material.dart';

class DialogUtilities {
  static void showLoadingDialog(BuildContext context, String message) {
    showAdaptiveDialog(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  width: 10,
                ),
                Text(message)
              ],
            ),
          );
        },
        barrierDismissible: false);
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context, String message,
      {String? posstiveActionName,
      Function()? posstiveAction,
      String? nigaiveActionName,
      Function()? nigaiveAction,
      bool dismissible = true}) {
    List<Widget> actions = [];
    if (posstiveActionName != null) {
      actions.add(TextButton(
          style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            //foregroundColor: MaterialStatePropertyAll(Colors.transparent)
          ),
          onPressed: () {
            Navigator.pop(context);
            posstiveAction?.call();
          },
          child: Text(posstiveActionName)));
    }
    if (nigaiveActionName != null) {
      actions.add(TextButton(
          style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            //foregroundColor: MaterialStatePropertyAll(Colors.transparent)
          ),
          onPressed: () {
            Navigator.pop(context);
            nigaiveAction?.call();
          },
          child: Text(
            nigaiveActionName,
            style: const TextStyle(color: Colors.red),
          )));
    }
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          content: Text(message),
          actions: actions,
        );
      },
    );
  }
}
