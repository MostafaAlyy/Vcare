import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:vcare/Core/ColorHelper.dart';

PageModel onBoardingPage3() {
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
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 90.0,
              ),
              child: Image.asset(
                'assets/images/ThirdOnBoardingImage.png',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                'Be Good ',
                style: pageTitleStyle,
                textAlign: TextAlign.left,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Text(
                'Be always in good Heath',
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
