import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3eeff),
      body: GetBuilder(
          init: HomeController(),
          builder: (controller) =>
              controller.pages.value.elementAt(controller.index.value)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.defaultDialog(
              title: 'add list',
              content: Column(
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: controller.ctrl,
                      )),
                  ElevatedButton(
                      onPressed: () {
                        controller.addList();
                        Get.back();
                      },
                      child: Text('add'))
                ],
              ));
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GetBuilder(
        init: HomeController(),
        builder: (controller) => AnimatedBottomNavigationBar(
          icons: [Icons.home, Icons.person],
          activeColor: Color(0xff2196f3),
          inactiveColor: Color(0xffa1b7e1),
          activeIndex: controller.index.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (p0) {
            controller.index.value = p0;
            controller.update();
          },
          //other params
        ),
      ),
    );
  }
}
