import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  var imageUrl;
  var textdata;
  bool isSelected;
  CustomAvatar({this.imageUrl, this.textdata, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
            width: width / 7.8546,
            height: height / 16.509,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.red : Colors.white,
              border: Border.all(width: 1, color: Colors.red),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                imageUrl,
                width: 20,
                height: 20,
              ),
            )),
        Text(textdata),
      ],
    );
  }
}
