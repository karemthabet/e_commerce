
import 'package:flutter/material.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: currentIndex == 0,
        onPopInvokedWithResult: (didPop, result) {
          {
            setState(() {
              currentIndex = 0;
            });
          }
        },
        child: IndexedStack(
          index: currentIndex,
          children: [
           // const HomeView(),
           // const AwarnessView(),
           // const ChatBotView(),
           // const MoreView(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          // BottomNavigationBarItem(
          //   icon: const Icon(FontAwesomeIcons.house, size: 20),
          //   label: 'Home'.tr(),
          // ),
          // BottomNavigationBarItem(
          //   icon: const Icon(FontAwesomeIcons.lightbulb, size: 20),
          //   label: 'Awareness'.tr(),
          // ),
          // BottomNavigationBarItem(
          //   icon: const Icon(FontAwesomeIcons.robot, size: 20),
          //   label: 'chat bot'.tr(),
          // ),
          // BottomNavigationBarItem(
          //   icon: const Icon(FontAwesomeIcons.gear, size: 20),
          //   label: 'More'.tr(),
          // ),
      
      
        ],
      ),
    );
  }
}
