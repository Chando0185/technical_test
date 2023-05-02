import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:technical_test/view/widgets/custombanner.dart';
import 'package:technical_test/view/widgets/custombutton.dart';
import 'package:technical_test/view/widgets/explorebtn.dart';
import 'package:technical_test/view/widgets/premiumbtn.dart';
import '../widgets/customrectbtn.dart';

class Page01 extends StatefulWidget {
  const Page01({super.key});

  @override
  State<Page01> createState() => _Page01State();
}

class _Page01State extends State<Page01> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    print(height);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: Center(
          child: Padding(
            padding: EdgeInsets.all(height / 45.85),
            child: Image.asset("assets/Group 3173.png"),
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(height / 45.85),
              child: Image.asset("assets/Icon-1.png"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(width / 82.545),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CustomContainer(
                      imageData: "assets/Icon.png",
                      title: "Cycle",
                      colordata: Color.fromRGBO(240, 90, 119, 8),
                    ),
                  ),
                  CustomContainer(
                    imageData: "assets/Group 3178.png",
                    title: "My Health",
                    colordata: Colors.white,
                  ),
                  CustomContainer(
                    imageData: "assets/Icon_basket.png",
                    title: "Shop",
                    colordata: Colors.white,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(width / 45.85),
                child: Column(
                  children: [
                    Container(
                      height: height / 6.87875,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(width / 82.545),
                              topRight: Radius.circular(width / 82.545))),
                      child: DatePicker(
                        DateTime.now(),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: Color.fromRGBO(240, 90, 119, 8),
                        selectedTextColor: Colors.white,
                        onDateChange: (date) {
                          // New date selected
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(width / 82.545),
                              bottomRight: Radius.circular(width / 82.545))),
                      height: height / 2.3,
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height / 27.515,
                          ),
                          CircularPercentIndicator(
                            radius: 130,
                            lineWidth: 25,
                            progressColor: Color.fromRGBO(240, 90, 119, 8),
                            percent: 0.3,
                            backgroundColor: Colors.grey.shade100,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Title",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                                Text(
                                  "1st Day",
                                  style: TextStyle(
                                      color: Color.fromRGBO(240, 90, 119, 8),
                                      fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 27.515,
                          ),
                          Container(
                              width: width / 2,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(235, 184, 194, 0.957),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Drink Herbal Tea For Cramps",
                                  style: TextStyle(
                                      color: Color.fromRGBO(240, 90, 119, 8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 27.515,
              ),
              Center(
                  child: Image.asset(
                "assets/Siliders.png",
                width: 60,
                height: 60,
              )),
              SizedBox(
                height: height / 27.515,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomRectBtn(
                    imageIcon: "assets/plus.png",
                    title: "Enter Your Symptoms",
                  ),
                  CustomRectBtn(
                    imageIcon: "assets/Icon3.png",
                    title: "Log Your Symptoms",
                  ),
                ],
              ),
              SizedBox(
                height: height / 27.515,
              ),
              Text(
                "Explore",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height / 27.515,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ExploreBtn(
                      categories: "Category 1",
                    ),
                    SizedBox(
                      width: width / 82.545,
                    ),
                    ExploreBtn(
                      categories: "Category 2",
                    ),
                    SizedBox(
                      width: width / 82.545,
                    ),
                    ExploreBtn(
                      categories: "Category 3",
                    ),
                    SizedBox(
                      width: width / 82.545,
                    ),
                    ExploreBtn(
                      categories: "Category 4",
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height / 27.515,
              ),
              Image.asset("assets/WhatsApp Image -1.png"),
              SizedBox(
                height: height / 27.515,
              ),
              CustomBanner(
                imgwidth: width / 3.9273,
                imgHeight: height / 5.503,
                image: "assets/Group 2131.png",
                title: "Demo APP",
                text:
                    "Free unlimited consultations with our panel doctor Up to 15% discount on home diagnostic sample collection \$15000 discount on health & life insurance",
              ),
              SizedBox(
                height: height / 27.515,
              ),
              Text(
                "Unlock Premium",
                style: TextStyle(
                    color: Color.fromRGBO(240, 90, 119, 8),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: height / 27.515,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PremiumBtn(
                    colors: Color.fromRGBO(240, 90, 119, 8),
                    data: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "30-Days Free Trail",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                              "(Then BDT 3,400,00/year only BDT 283.34/month)",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              )),
                        )),
                      ],
                    ),
                  ),
                  PremiumBtn(
                    colors: Colors.white,
                    data: Center(
                        child: Text("1 Month BDT 700.00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                  ),
                ],
              ),
              SizedBox(
                height: height / 27.515,
              ),
              CustomBanner(
                imgwidth: width / 1.96365,
                imgHeight: height / 3.3018,
                image: "assets/Group 3183.png",
                title: "Add My Partner",
                text: "",
              ),
              SizedBox(
                height: height / 27.515,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(240, 90, 119, 8),
                borderRadius: BorderRadius.only(topRight: Radius.circular(10))),
            height: height / 13.7575,
            width: MediaQuery.of(context).size.width / 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("assets/Icon4.png"),
            ),
          ),
          Container(
            color: Colors.white,
            height: 60,
            width: MediaQuery.of(context).size.width / 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("assets/Group 3185.png"),
            ),
          ),
          Container(
            color: Colors.white,
            height: 60,
            width: MediaQuery.of(context).size.width / 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("assets/Group 3184.png"),
            ),
          ),
          Container(
            color: Colors.white,
            height: 60,
            width: MediaQuery.of(context).size.width / 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("assets/Send.png"),
            ),
          )
        ],
      ),
    );
  }
}
