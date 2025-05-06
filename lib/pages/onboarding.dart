import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            "images/restaurant.jpg",
            height: MediaQuery.of(context).size.height / 1.7,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          // Bottom White Container
          Positioned(
            top: MediaQuery.of(context).size.height / 1.9,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20.0),
                  // Title Text
                  const Text(
                    "Get the latest news",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Secondary Image
                  Image.asset(
                    "images/webdev.jpg",
                    height: 100,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 30.0),
                  // Get Started Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Material(
                      elevation: 3.3,
                      borderRadius: BorderRadius.circular(30.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.0),
                        onTap: () {
                          // Add your navigation or action here
                          print("Get Started button tapped!");
                        },
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 47, 45, 150),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Center(
                            child: Text(
                              "Get Started",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 231, 230, 235),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}