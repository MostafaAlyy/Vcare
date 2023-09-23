import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:vcare/Core/ColorHelper.dart';

PageModel onBoardingPage1() {
  return PageModel(
    widget: DecoratedBox(
      decoration: BoxDecoration(
        color: ColorHelper.mainColor,
        border: Border.all(
          width: 0.0,
          color: ColorHelper.mainColor,
        ),
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 90.0,
              ),
              child: Image.asset(
                'assets/images/doctorIcon.png',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                'Search Doctors',
                style: pageTitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Text(
                'Get list of best doctors \n nerby you',
                style: pageInfoStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
