import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3eeff),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Center(
          child: GetBuilder(
            init: HomeController(),
            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      controller.getImage(ImageSource.gallery);
                    },
                    child: Container(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                            child: controller.imagepath == ''
                                ? Image.asset('assets/images/per.png')
                                : Image.file(
                                    File(controller.imagepath.value))))),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'yekta',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Color(0xff37a0f4),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'soltani',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Color(0xff37a0f4),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
