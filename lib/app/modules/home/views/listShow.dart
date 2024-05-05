import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';

class ListShowView extends StatelessWidget {
  const ListShowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3eeff),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 28, horizontal: 20),
        child: Column(
          children: [
            Text(
              'things to Do!',
              style: TextStyle(
                  color: Color(0xff37a0f4),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder(
              init: HomeController(),
              builder: (controller) =>  Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:controller.todo.value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        height: 150,
                        width: Get.width - 20,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              controller.todo.value.elementAt(index)['txt'].toString(),
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff37a0f4),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            Checkbox(
                              value:controller.todo.value.elementAt(index)['checkbox'],
                              onChanged: (value) {
                                controller.todo.value.elementAt(index)['checkbox']=value;
                                controller.box.write('todo', controller.todo.value);
                                controller.update();
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
