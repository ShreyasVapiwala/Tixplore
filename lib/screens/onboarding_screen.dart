import 'package:flutter/material.dart';
import 'package:ticket_reselling/screens/sign_up_page.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int index = 0; // Track the current screen index

  // Content for each screen
  final List<Map<String, String>> screens = [
    {
      'title': 'Find Events Near You & Book Tickets Instantly!',
      'image': 'lib/assets/start_screen_img1.png',
    },
    {
      'title': 'Discover Concerts, Sports, & Entertainment Just for You!',
      'image': 'lib/assets/start_screen_img2.png',
    },
    {
      'title': 'Secure Your Tickets Anytime, Anywhere with Ease!',
      'image': 'lib/assets/start_screen_img3.png',
    },
    {
      'title': 'Are you Ready to Experience the Best Moments of Your Life?',
      'image': 'lib/assets/start_screen_img4.png',
    },
  ];

  void navigateToSignUpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/start_screen_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              // Animated Image Section
              Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    screens[index]['image']!,
                    key: ValueKey<int>(index),
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // Animated Text Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Text(
                    screens[index]['title']!,
                    key: ValueKey<int>(index),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Bottom Controls
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 110.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dots Indicator
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: Row(
                      children: List.generate(4, (dotIndex) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 8,
                            width: index == dotIndex ? 30 : 8,
                            decoration: BoxDecoration(
                              color: index == dotIndex ? Colors.white : Colors.white54,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  // Arrow Button or "Let's Begin!" Button
                  Container(
                    margin: const EdgeInsets.only(right: 30.0),
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: index == screens.length - 1
                        ? TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                            ),
                            onPressed: navigateToSignUpPage,
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Let's Begin!",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8), // Space between text and arrow
                                Icon(Icons.arrow_forward, color: Colors.black),
                              ],
                            ),
                          )
                        : IconButton(
                            icon: const Icon(Icons.arrow_forward, color: Colors.black),
                            onPressed: () {
                              setState(() {
                                index++;
                              });
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}