import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 3), (timer) {
      int? nextPage = pageController.page?.toInt();

      if (nextPage == null) {
        return;
      }

      if (nextPage == 1) {
        nextPage = 0;
      } else {
        nextPage++;
      }
      pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  Widget build(BuildContext context) {
    // app bar 에 영향으로 적용이 안될 수 있다.
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Blog App",
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: PageView(
        controller: pageController,
        children: [1, 2]
            .map(
              (e) => Image.asset(
                'assets/img/$e.png',
                fit: BoxFit.fitWidth,
              ),
            )
            .toList(),
      ),
    );
  }
}
