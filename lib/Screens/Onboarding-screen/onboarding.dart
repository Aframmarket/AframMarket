import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Onboarding-screen/buildOnboardingScreen.dart';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();

  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> completeOnboarding(BuildContext context) async {
    //straight navigation
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showHome', true);
    Navigator.of(context).pushNamed("/login");
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() => isLastPage = index == 2);
        },
        children: [
          BuildOnboardingScreen(
              heading: "All your favorites",
              subHeading: "Get all your loved foods in one once place, you just place the order we do the rest",
              imageUrl: "assets/onboard-img1.png"
          ),
          BuildOnboardingScreen(
              heading: "All your favorites",
              subHeading: "Get all your loved foods in one once place, you just place the order we do the rest",
              imageUrl: "assets/onboard-img2.png"
          ),
          BuildOnboardingScreen(
              heading: "Free delivery offers",
              subHeading: "Get all your loved foods in one once place, you just place the order we do the rest",
              imageUrl: "assets/onboard-img3.png"
          ),
        ],
      ),
      bottomSheet: Container(
          color: Colors.white,
          height: screenHeight * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmoothPageIndicator(
                  controller: controller, // PageController
                  count: 3,
                  effect: WormEffect(
                      spacing: 12.0,
                      dotWidth: 13.0,
                      dotHeight: 13.0,
                      dotColor: AppColors.primaryYellowGreyColor,
                      activeDotColor: Colors.yellow), // your preferred effect
                  onDotClicked: (index) {}
              ),
              SizedBox(
                height: 50,
              ),
              isLastPage ? SizedBox() : Padding(
                padding: const EdgeInsets.all(15.0),
                child: LargeBtn(
                    btnText: "NEXT",
                    btnColor: AppColors.primaryYellowColor,
                    onTap: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    btnTextColor: Colors.white,
                ),
              ),
              isLastPage ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: LargeBtn(
                    btnText: "Start",
                    btnColor: AppColors.primaryYellowColor,
                    onTap: () {
                      completeOnboarding(context);
                    },
                    btnTextColor: Colors.white
                ),
              )
                  : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: LargeBtn(
                    btnText: "Skip",
                    btnColor: Colors.white,
                    onTap: () {
                      controller.jumpToPage(2);
                    },
                    btnTextColor: Colors.black
                                  ),
                  ),
              SizedBox(
                height: 10,
              ),
            ],
          )
      ),
    );
  }
}
