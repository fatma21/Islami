import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/core/screens/appbar/appbar_widget.dart';
import 'package:islami/core/screens/onboarding/onboard_widget.dart';
import 'package:islami/core/utils/app_asstes.dart';
import 'package:islami/core/utils/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkMianColor,
      appBar: AppbarWidget(),
      body: IntroductionScreen(
        controlsMargin: EdgeInsets.only(top: 120),
        globalBackgroundColor: AppColors.darkMianColor,
        pages: [
          PageViewModel(
            titleWidget: const SizedBox(),
            bodyWidget: OnboardWidget(imageName: AppAsstes.onbord1, Title: "Welcome To Islami App"),
          ),
          PageViewModel(
            titleWidget: const SizedBox(),
            bodyWidget: OnboardWidget(imageName: AppAsstes.onbord2, Title: "Welcome To Islami App",descreption: "We Are Very Excited To Have You In Our Community.",)
          ),
          PageViewModel(
              titleWidget: const SizedBox(),
              bodyWidget: OnboardWidget(imageName: AppAsstes.onbord3, Title: "Reading the Quran",descreption: "Read, and your Lord is the Most Generous",)
          ),
          PageViewModel(
              titleWidget: const SizedBox(),
              bodyWidget: OnboardWidget(imageName: AppAsstes.onbord4, Title: "Bearish",descreption: "Praise the name of your Lord, the Most High",)
          ),
          PageViewModel(
              titleWidget: const SizedBox(),
              bodyWidget: OnboardWidget(imageName: AppAsstes.onbord5, Title: "Holy Quran Radio",descreption: "You can listen to the Holy Quran Radio through the application for free and easily",)
          ),
        ],

        dotsDecorator: DotsDecorator(
          activeColor: AppColors.lightMainColor,
        ),
        showBackButton: true,
        back: const Text("Back",style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.lightMainColor)),
        next: const Text("Next",style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.lightMainColor)),
        done: const Text("Finish", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.lightMainColor)),

        onDone: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }
}
