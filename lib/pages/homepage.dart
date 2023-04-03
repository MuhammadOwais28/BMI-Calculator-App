// ignore_for_file: deprecated_member_use

import 'package:bmi_calculator/provider/my_provider.dart';
import 'package:bmi_calculator/widgets/age_widget.dart';
import 'package:bmi_calculator/widgets/genders.dart';
import 'package:bmi_calculator/widgets/height_widget.dart';
import 'package:bmi_calculator/widgets/weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MyProvider>();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.canvasColor,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              color: context.theme.accentColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Genders(),
            HeightWidget(
              prov: provider,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeightWidget(
                    // prov: provider,
                  ),
                  AgeWidget(
                    prov: provider,
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
                    child: InkWell(
                      onTap: () => zeroVal(
                              provider.weight, provider.height, provider.age)
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Height or Age or Weight can't be 0.")))
                          : showSimpDialogue(
                              context, provider.calBmi(), provider.calstatus()),
                      child: Container(
                        height: size.height * .08,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: context.theme.buttonColor,
                        ),
                        child: const Center(
                            child: Text(
                          "Calculate BMI",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showSimpDialogue(BuildContext context, double bmi, String status) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            height: 90,
            width: 90,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "BMI ",
                  textScaleFactor: 1.2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "BMI: ${bmi.toStringAsFixed(1)}",
                      textScaleFactor: 0.8,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Status: $status",
                    textScaleFactor: 0.8,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

bool zeroVal(int weight, double height, int age) {
  if (weight <= 0 || height <= 0 || age <= 0) {
    return true;
  }
  return false;
}
