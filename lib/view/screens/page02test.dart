import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:technical_test/controller/controller.dart';
import 'package:technical_test/view/screens/viewitems.dart';
import 'package:technical_test/view/widgets/customavatart.dart';

class Page02Test extends StatelessWidget {
  const Page02Test({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
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

    List<String> tempArray = [];
    bool isSelected = false;

    Future<void> _showAlertDialog(int index, int i) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            // <-- SEE HERE
            backgroundColor: Color.fromRGBO(244, 143, 163, 0.996),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                    'ARE YOU SURE WANT TO SELECT THIS?',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  tempArray.add(controller
                      .dataFromAPI!.data.symptoms[index].subSymptom[i].title
                      .toString());
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
          child: Container(
            width: width / 11.221,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: Colors.white.withOpacity(0.5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset("assets/Polygon 9.png"),
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Obx(
          () => controller.isloading == true
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemCount: controller.dataFromAPI!.data.symptoms.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller
                                    .dataFromAPI!.data.symptoms[index].title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                height: height / 8.2545,
                                child: ListView.separated(
                                  itemCount: controller.dataFromAPI!.data
                                      .symptoms[index].subSymptom.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 20,
                                    );
                                  },
                                  itemBuilder: (_, i) => GestureDetector(
                                    onTap: () {
                                      if (tempArray.contains(controller
                                          .dataFromAPI!
                                          .data
                                          .symptoms[index]
                                          .subSymptom[i]
                                          .title
                                          .toString())) {
                                        tempArray.remove(controller
                                            .dataFromAPI!
                                            .data
                                            .symptoms[index]
                                            .subSymptom[i]
                                            .title
                                            .toString());
                                      } else {
                                        _showAlertDialog(index, i);
                                      }
                                      print(tempArray.toString());
                                    },
                                    child: CustomAvatar(
                                      isSelected: tempArray
                                                  .contains(controller
                                                      .dataFromAPI!
                                                      .data
                                                      .symptoms[index]
                                                      .subSymptom[i]
                                                      .title)
                                                  .toString() ==
                                              true
                                          ? true
                                          : false,
                                      imageUrl: controller.dataFromAPI!.data
                                          .symptoms[index].subSymptom[i].icon
                                          .toString(),
                                      textdata: controller.dataFromAPI!.data
                                          .symptoms[index].subSymptom[i].title
                                          .toString(),
                                    ),
                                  ),
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(
              () => ViewItems(
                    arraydata: tempArray.toList(),
                  ),
              arguments: tempArray);
        },
        backgroundColor: Color.fromRGBO(240, 90, 119, 8),
        label: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                    width: width / 9.81,
                    height: height / 20.63,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/Polygon 1.png",
                        width: 20,
                      ),
                    )),
              ),
            ),
            Text("VIEW ALL SELECTED ITEMS")
          ],
        ),
      ),
    );
  }
}
