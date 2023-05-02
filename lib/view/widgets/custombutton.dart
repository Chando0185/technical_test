import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  var imageData;
  var title;
  var colordata;
  CustomContainer({super.key, this.imageData, this.title, this.colordata});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 2,
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: width / 4.909125,
          height: height / 10.318125,
          color: colordata,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  imageData,
                  width: 20,
                ),
              ),
              SizedBox(height: 10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
