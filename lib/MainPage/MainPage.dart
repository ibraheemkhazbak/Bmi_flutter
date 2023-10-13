import 'dart:math';

import 'package:bmi_calculator/Global/Palette.dart';
import 'package:bmi_calculator/Global/StandardWidgets.dart';
import 'package:bmi_calculator/ResultPage/ResultPage.dart';
import 'package:flutter/material.dart';

import 'Widgets/BmiSlider.dart';
import 'Widgets/GenderSelector.dart';
import 'Widgets/Global.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  GenderButtonController genderController=GenderButtonController();
  ValueController heightController=ValueController();
  ValueController weightController=ValueController(value: 70);
  ValueController ageController=ValueController(value: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK,
      appBar: AppBar(
        toolbarHeight: 85,
        backgroundColor:  LIGHT,
        title: const Center(
          child: Text("BMI Calculator",style: TextStyle(
              fontSize: 35,
              color: WHITE,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:31.0),
                  child: MaleFemaleSelector(genderController: genderController),
                ),
                Container(
                  width: double.infinity,
                  height: 189,
                  decoration: BoxDecoration(
                    color: LIGHT,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.only(top: 57),
                  padding: const EdgeInsets.only(top: 38),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          standardText("Height",fontSize: 20),
                          standardText("CM",isBold: false,fontSize: 10,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:60.0),
                        child: BMIslider(sliderController: heightController,),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:85.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NumberSelectionButton(text:"WEIGHT",valueController: weightController),
                      NumberSelectionButton(text: "AGE",valueController: ageController),
                    ],
                  ),
                ),
                const Spacer(),
                ],
            ),
          ),
           Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height:84,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: RED
                ),
                onPressed: (){
                  double bmi= calculateBmi(weightController.value,heightController.value);
                  print(bmi);
                  String resultText="none";
                  String resultReason="none";
                  if(bmi<=18.5){
                    resultText="UNDERWEIGHT";
                    resultReason="You need to gain more weight.";
                  }else if(bmi<25){
                   resultText="NORMAL";
                   resultReason="You are in perfect bmi.";
                  }else if(bmi<30){
                    resultText="OVERWEIGHT";
                    resultReason = "You need to lose weight.";
                  }else if(bmi<35){
                    resultText="OBESE I";
                    resultReason = "You need to lose weight.";
                  }else if(bmi<40){
                    resultText="OBESE II";
                    resultReason = "You need to lose weight.";
                  }else if(bmi>=40){
                    resultText="OBESE III";
                    resultReason = "You need to lose weight.";
                  }
                  Navigator.push(context,MaterialPageRoute(builder:(context)=> ResultPage(resultNumber: bmi,resultReason: resultReason,resultText: resultText,)));

                },
                child: const Center(
                  child: Text("CALCULATE",style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                  ),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double calculateBmi(double weight, double height) {
    return weight/pow(height/100, 2);
  }
}

class NumberSelectionButton extends StatefulWidget {
  const NumberSelectionButton({
    super.key,
    required this.valueController, required this.text,
  });
  final String text;
  final ValueController valueController;

  @override
  State<NumberSelectionButton> createState() => _NumberSelectionButtonState();
}

class _NumberSelectionButtonState extends State<NumberSelectionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 13,bottom: 27,left:   23,right: 23),
        width: 136,
        height: 159,
        decoration:     BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: LIGHT),
      child: Column(children: <Widget>[
        standardText(widget.text),
        const SizedBox(height: 10,),
        standardText(widget.valueController.value.toString()),
        Padding(
          padding: const EdgeInsets.only(top:15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              width:30,
              height: 30,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
              child: Stack(
                children: [
                  const Center(child:Icon(Icons.remove,color: DARK,size: 28,)),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      splashColor: Colors.black,
                      onTap: (){
                        setState((){
                        widget.valueController.value--;
                        });
                      },),
                  ),
                ],
              ),
            ),
            Container(
              width:30,
              height: 30,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
              child: Stack(
                children: [
                  const Center(child: Icon(Icons.add,color: DARK,size: 28,)),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      splashColor: Colors.black,
                      onTap: (){
                        setState((){
                        widget.valueController.value++;
                        });
                      },),
                  ),
                ],
              ),
            ),
          ],),
        )
      ],),
    );
  }
}
