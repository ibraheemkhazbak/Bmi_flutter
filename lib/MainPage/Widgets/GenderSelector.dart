
import 'package:flutter/material.dart';

import '../../Global/Palette.dart';
import '../../Global/StandardWidgets.dart';

class MaleFemaleSelector extends StatefulWidget {
  const MaleFemaleSelector({
    super.key,
    required this.genderController,
  });

  final GenderButtonController genderController;

  @override
  State<MaleFemaleSelector> createState() => _MaleFemaleSelectorState();
}

class _MaleFemaleSelectorState extends State<MaleFemaleSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GenderButton(
          isActive: !widget.genderController.isMale,
          icon: Icons.female_outlined,
          onPressed: (){
            setState(() {
              widget.genderController.isMale=false;
            });
          },
          text: "Female",
        ),
        GenderButton(
          text: "Male",
          isActive:widget.genderController.isMale,
          icon: Icons.male_outlined,
          onPressed: (){
            setState(() {
              widget.genderController.isMale=true;
            });
          },

        ),

      ],
    );
  }
}

class GenderButtonController {
  bool isMale=false;
}

class GenderButton extends StatelessWidget {
  const GenderButton({
    required this.icon,
    required this.isActive,
    required this.onPressed,
    super.key, required this.text,
  });
  final String text;
  final IconData? icon;
  final bool isActive;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136,
      height: 159,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(top:37,bottom: 21),
          backgroundColor: (isActive)?SELECTED_BUTTON:LIGHT,
        ),
        onPressed:onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon,size: 68,),
            standardText(text),
          ],
        ),
      ),
    );
  }
}
