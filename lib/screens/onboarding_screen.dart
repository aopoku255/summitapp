
import 'package:cbfapp/widgets/MainText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_pageIndex);
    print(_pages.length);
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              Expanded(
                child: PageView.builder(
                  itemCount: _pages.length,
                  controller: _pageController,
                  onPageChanged: (index){
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    image: _pages[index].image,
                    title: _pages[index].title,
                    description: _pages[index].description,
                  ),
                ),
              ),
              _pageIndex + 1 == _pages.length ? InkWell(onTap: (){
                Navigator.pushNamed(context, '/landing');
              }, child: Container(padding: EdgeInsets.symmetric(vertical: 20), child: Text("Proceed", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),), width: MediaQuery.of(context).size.width - 20, decoration: BoxDecoration(color: AppColors.primaryVoilet, borderRadius: BorderRadius.circular(100)),)) : Row(
                children: [
                  ...List.generate(_pages.length, (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: DotIndicator(isActive: index == _pageIndex),
                  )),
                  Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: AppColors.primaryVoilet,
                          foregroundColor: Colors.white),
                      child: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 14 : 6,
      width: 4,
      decoration: BoxDecoration(
        color: AppColors.primaryVoilet,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;
  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> _pages = [
  Onboard(
    image: "assets/images/events.png",
    title: "Welcome to CARISCA Research Summit 2025!",
    description: "Dive into groundbreaking research, connect with global scholars, and explore Africa’s academic pulse, right here in Nigeria. Let’s show you around.",
  ),
  Onboard(
    image: "assets/images/schedule.png",
    title: "Build your personal schedule",
    description: "Browse sessions by topic, speaker, or day. Tap ★ to save your must-attend panels and get reminders before they start. Start exploring the agenda.",
  ),
  Onboard(
    image: "assets/images/gather.png",
    title: "Virtual? In-Person? We’ve Got You.",
    description: "Browse sessions by topic, speaker, or day. Tap ★ to save your must-attend panels and get reminders before they start. Start exploring the agenda."
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 400,
        ),
        // const Spacer(),
        SizedBox(height: 30,),
        MainText(text: title, fontWeight: FontWeight.bold, fontSize: 24,),
        SizedBox(height: 30,),
        MainText(text: description),
        const Spacer()
      ],
    );
  }
}
