import 'package:flutter/material.dart';

class PremiumBtn extends StatelessWidget {
  Widget data;
  var colors;
  PremiumBtn({super.key, required this.data, this.colors});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        height: height / 5.503,
        width: width / 2.6182,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: colors),
        child: Center(child: data),
      ),
    );
  }
}
