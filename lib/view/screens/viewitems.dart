import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ViewItems extends StatelessWidget {
  List<dynamic> arraydata;
  ViewItems({super.key, required this.arraydata});

  @override
  Widget build(BuildContext context) {
    var MONTHS = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];

    String formattedDateTime() {
      DateTime now = new DateTime.now();
      return now.day.toString() + " " + MONTHS[now.month - 1];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          formattedDateTime(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        leading: Card(
          elevation: 2,
          shadowColor: Colors.white,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white.withOpacity(0.5),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset("assets/Polygon 9.png"),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.question_mark_rounded,
              color: Colors.grey,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
          itemCount: arraydata.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(Get.arguments[index].toString()),
            );
          }),
    );
  }
}
