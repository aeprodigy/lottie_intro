// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie_intro/pages/onboaring_pages.dart';
import 'package:lottie_intro/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                children: [
                  OnboaringPages(
                      animationUrl:
                          'https://lottie.host/b0405d4e-e517-453a-97b7-c2fa84322bb0/06R1EIQFd9.json',
                      title: 'Welcome',
                      description: 'Discover New Experiences'),
                  OnboaringPages(
                      animationUrl:
                          'https://lottie.host/fc51d5ac-ed42-4e3c-adfb-ead7aa0ea161/cIGWf0hWeX.json',
                      title: 'Explore',
                      description: 'Find What you are looking for'),
                  OnboaringPages(
                    animationUrl:
                        'https://lottie.host/35f717f4-1830-428a-befe-b379fff3ee41/Dj0LrxZpwb.json',
                    title: 'Get Started',
                    description: 'Lets Dive in and Enjoy the journey',
                  ),
                ],
              ),
            ),
            //smooth page
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: WormEffect(
                dotColor: Colors.grey,
                activeDotColor: Colors.grey[800]!,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
            //
            SizedBox(
              height: 20,
            ),
            isLastPage
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24))),
                    child: Text('Get Started'))
                : TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey[800]),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
