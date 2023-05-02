import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:technical_test/view/screens/viewitems.dart';

import 'package:technical_test/view/widgets/customavatart.dart';
import 'package:http/http.dart' as http;

import '../../model/datamodel.dart';

class Page02 extends StatefulWidget {
  const Page02({super.key});

  @override
  State<Page02> createState() => _Page02State();
}

class _Page02State extends State<Page02> {
  bool _isLoading = true;
  bool isSelected = false;
  late List<DataModel> selectedContacts;
  List<String> tempArray = [];

  Future<void> _showAlertDialog(int index, int i) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          backgroundColor: Colors.redAccent,
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'ARE YOU SURE WANT TO SELECT THIS?',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                setState(() {
                  tempArray.add(dataFromAPI!
                      .data.symptoms[index].subSymptom[i].title
                      .toString());
                });

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  DataModel? dataFromAPI;
  _getData() async {
    try {
      String url = "https://api.npoint.io/30bd2c680d812dd23df1";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        print("Daata");
        dataFromAPI = DataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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

  @override
  Widget build(BuildContext context) {
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
      body: dataFromAPI == null
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: dataFromAPI!.data.symptoms.length,
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
                            dataFromAPI!.data.symptoms[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            height: 100.0,
                            child: ListView.separated(
                              itemCount: dataFromAPI!
                                  .data.symptoms[index].subSymptom.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  width: 20,
                                );
                              },
                              itemBuilder: (_, i) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (tempArray.contains(dataFromAPI!.data
                                        .symptoms[index].subSymptom[i].title
                                        .toString())) {
                                      tempArray.remove(dataFromAPI!.data
                                          .symptoms[index].subSymptom[i].title
                                          .toString());
                                    } else {
                                      _showAlertDialog(index, i);
                                    }
                                    print(tempArray.toString());
                                  });
                                },
                                child: CustomAvatar(
                                  isSelected: tempArray.contains(dataFromAPI!
                                          .data
                                          .symptoms[index]
                                          .subSymptom[i]
                                          .title
                                          .toString())
                                      ? true
                                      : false,
                                  imageUrl: dataFromAPI!
                                      .data.symptoms[index].subSymptom[i].icon
                                      .toString(),
                                  textdata: dataFromAPI!
                                      .data.symptoms[index].subSymptom[i].title
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(
              () => ViewItems(
                    arraydata: tempArray.toList(),
                  ),
              arguments: tempArray);
        },
        backgroundColor: Colors.redAccent,
        label: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                    width: 40,
                    height: 40,
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
