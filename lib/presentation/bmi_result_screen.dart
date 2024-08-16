import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../data/models/bmi_model.dart';
import 'bmi_screen.dart';

class BmiResultScreen extends StatelessWidget {
  final BmiModel bmi;
  const BmiResultScreen({
    super.key,
    required this.bmi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.timelapse,
          color: Colors.deepPurple,
          size: 40,
        ),
        title: const Row(
          children: [
            Expanded(
              child: Text(
                "BMI Calculator",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.settings,
            size: 30,
          ),
          Gap(8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: ListView(
          children: [
            const Text(
              "Result",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Your BMI is",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          bmi.status.status,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.deepPurple.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const Spacer(),
                  Text(
                    bmi.imc.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  // const Spacer(),
                  // Slider(
                  //   value: 0.5,
                  //   // min: unit == "Cm"
                  //   //     ? 31
                  //   //     : unit == "Ft"
                  //   //         ? 1 //cmToFt(25).floorToDouble()
                  //   //         : 12, //cmToIn(25).floorToDouble(),
                  //   // max: unit == "Cm"
                  //   //     ? 275
                  //   //     : unit == "Ft"
                  //   //         ? cmToFt(275).floorToDouble()
                  //   //         : cmToIn(275).floorToDouble(),
                  //   activeColor: Colors.deepPurple,
                  //   inactiveColor: Colors.grey,
                  //   onChanged: (double value) {
                  //     setState(() {
                  //       // heightValue = value;
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
            const Gap(10),
            Text(
              bmi.status.status,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Gap(10),
            RichText(
              text: TextSpan(
                text: bmi.status.advice,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const Gap(10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BmiScreen(),
                  ),
                );
              },
              label: const Text(
                "Re-Calculate",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              icon: const Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
                size: 30,
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                    vertical: 10,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
