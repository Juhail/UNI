import 'dart:async';

import 'package:flutter/material.dart';

class corousal extends StatefulWidget {
  @override
  _corousalState createState() => _corousalState();
}

class _corousalState extends State<corousal> {
  final List<String> imagePaths = [
    'assets/icon.jpg',
    'assets/paytm.jpg',
    'assets/fitty.jpg'
  ];
  late List<Widget> pages;
  int activePage = 0;
  final PageController pageController = PageController(initialPage: 0);
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (pageController.page == imagePaths.length - 1) {
        pageController.animateTo(0,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      } else {
        pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    pages = List.generate(imagePaths.length,
        (index) => ImagePlaceHolder(imagePath: imagePaths[index]));
    startTimer();
  }

  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: PageView.builder(
                    controller: pageController,
                    itemCount: 3,
                    onPageChanged: (value) {
                      setState(() {
                        activePage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return pages[index];
                    }),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                          pages.length,
                          (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                  onTap: () {
                                    pageController.animateToPage(index,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  },
                                  child: CircleAvatar(
                                    radius: 4,
                                    backgroundColor: activePage == index
                                        ? Colors.yellow
                                        : Colors.grey,
                                  ),
                                ),
                              ))),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  final String? imagePath;

  const ImagePlaceHolder({super.key, this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath!,
      fit: BoxFit.cover,
    );
  }
}
