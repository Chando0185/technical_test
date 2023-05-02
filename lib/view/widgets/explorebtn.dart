import 'package:flutter/material.dart';

class ExploreBtn extends StatelessWidget {
  const ExploreBtn({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // width: width / 3.27275,
        // height: height / 8.2545,
        width: width / 5, height: height / 11,
        color: Colors.white,
        alignment: Alignment.center, // where to position the child
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: width / 11.22,
                height: height / 23.58,
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/Group 3181.png"),
                ),
              ),
            ),
            Text("Explore")
          ],
        ),
      ),
    );
  }
}
