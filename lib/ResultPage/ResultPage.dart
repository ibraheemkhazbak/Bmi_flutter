import 'package:bmi_calculator/Global/Palette.dart';
import 'package:bmi_calculator/Global/StandardWidgets.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key,required this.resultNumber,required this.resultReason, required this.resultText});
  final double resultNumber;
  final String resultText;
  final String resultReason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right:15,top:56),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios_new,color: WHITE,size: 45,),
                  const SizedBox(width: 11,),
                  standardText("Your Result:",fontSize: 36)
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Container(
                  width: 383,
                  height: 535,
                  decoration:     BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: LIGHT),
                child: Padding(
                  padding: const EdgeInsets.only(top:45.0),
                  child: Column(
                    children: [
                      standardText(resultText,color: GREEN,fontSize: 35),
                      Padding(
                        padding: const EdgeInsets.only(top: 123.0),
                        child: Text(resultNumber.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.w700,
                              color: WHITE
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:123.0),
                        child: Text(resultReason,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: WHITE
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
