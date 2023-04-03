import 'package:bmi_calculator/provider/my_provider.dart';
import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

class HeightWidget extends StatelessWidget {
  const HeightWidget({super.key, required this.prov});

  final MyProvider prov;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: size.height * .18,
        width: size.width * .90,
        decoration: BoxDecoration(
            color: context.cardColor, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Height (cm)",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: context.accentColor),
              ),
            ),
            Text(
              prov.height.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: context.accentColor),
            ),
            Slider(
              min: 0,
              max: 250,
              // ignore: deprecated_member_use
              activeColor: context.theme.buttonColor,
              inactiveColor: Colors.red[200],
              divisions: 250,
              value: prov.height,
              onChanged: (value) {
                prov.updateheight(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
