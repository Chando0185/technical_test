import 'package:flutter/material.dart';

class CustomRectBtn extends StatelessWidget {
  var imageIcon;
  var title;
  CustomRectBtn({super.key, this.imageIcon, this.title});

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
          width: width / 2.8052,
          height: height / 11.79,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  imageIcon,
                  width: 20,
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
