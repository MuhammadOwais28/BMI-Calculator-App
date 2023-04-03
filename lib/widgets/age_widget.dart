// ignore_for_file: deprecated_member_use

import 'package:bmi_calculator/provider/my_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AgeWidget extends StatelessWidget {
  const AgeWidget({super.key, required this.prov});

  final MyProvider prov;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .42,
      height: size.height * .25,
      decoration: BoxDecoration(
          color: context.cardColor, borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8)),
            Text(
              "Age",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: context.theme.accentColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Text(
                prov.age.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: context.theme.accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 60),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 4),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        iconSize: 30,
                        onPressed: () {
                          if (prov.age > 0) {
                            prov.subAge();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Age can't be 0.")));
                          }
                        },
                        icon: Icon(
                          CupertinoIcons.minus_circle_fill,
                          color: context.theme.buttonColor,
                        )),
                    IconButton(
                        iconSize: 30,
                        onPressed: () {
                          prov.addAge();
                        },
                        icon: Icon(CupertinoIcons.add_circled_solid,
                            color: context.theme.buttonColor))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
