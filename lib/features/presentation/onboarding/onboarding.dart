import 'package:flutter/material.dart';
import 'package:flutter_demo/features/presentation/screens/home_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {'image': 'assets/onboarda.jpg', 'title': 'Unlock a New Era of Driving'},
    {
      'image': 'assets/onboardb.jpg',
      'title': 'Redefining Your Travel Experience',
    },
    {'image': 'assets/onboardc.jpg', 'title': 'Your Perfect Ride Awaits'},
  ];

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          if (currentIndex < onboardingData.length - 1)
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade800,
              ),
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.7, 
                  child: PageView.builder(
                    controller: controller,
                    onPageChanged:
                        (value) => setState(() {
                          currentIndex = value;
                        }),
                    itemCount: onboardingData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxHeight:
                                  screenHeight * 0.45, 
                              maxWidth:
                                  screenWidth * 0.9, 
                            ),
                            child: Center(
                              child: Image.asset(
                                onboardingData[index]['image']!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onboardingData.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.only(right: 4),
                                width: index == currentIndex ? 18 : 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      index == currentIndex
                                          ? Colors.black54
                                          : Colors.grey.shade400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth:
                                  screenWidth * 0.8, 
                            ),
                            child: Text(
                              onboardingData[index]['title']!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    screenWidth * 0.07, 
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: InkWell(
                    onTap: () async {
                      if (currentIndex == (onboardingData.length - 1)) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                        );
                      } else {
                        await controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black45,
                      radius: screenWidth * 0.06, 
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: screenWidth * 0.05,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          );
        },
      ),
    );
  }
}
