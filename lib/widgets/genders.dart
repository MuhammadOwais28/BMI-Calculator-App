// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Genders extends StatefulWidget {
  const Genders({super.key});

  @override
  State<Genders> createState() => _GendersState();
}

class _GendersState extends State<Genders> {
  bool ismale = true;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                ismale = true;
              });
            },
            child: Container(
              width: size.width * .42,
              height: size.height * .25,
              decoration: BoxDecoration(
                  color: ismale ? Colors.blue[600] : context.cardColor,
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 22)),
                    SizedBox(
                      height: size.height * .12,
                      child: Image.asset(
                        "images/maleicon.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 13)),
                    Text(
                      "Male",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: context.theme.accentColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 200,
          //   width: 20,
          // ),
          InkWell(
            onTap: () {
              ismale = false;
              setState(() {});
            },
            child: Container(
              width: size.width * .42,
              height: size.height * .25,
              decoration: BoxDecoration(
                  color: !ismale ? Colors.pink[300] : context.cardColor,
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(18)),
                    SizedBox(
                      height: size.height * .145,
                      child: Image.asset("images/femaleicon.png"),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                    Text(
                      "Female",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: context.theme.accentColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
