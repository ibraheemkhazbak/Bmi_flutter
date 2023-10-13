import 'package:flutter/material.dart';

import '../../Global/Palette.dart';
import 'Global.dart';


class BMIslider extends StatefulWidget {
  const BMIslider({
    super.key, required this.sliderController,
  });
  final ValueController sliderController;

  @override
  State<BMIslider> createState() => _BmiSliderState();
}

class _BmiSliderState extends State<BMIslider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: ACTIVE_SLIDER,
        inactiveTrackColor: INACTIVE_SLIDER,
        thumbColor: RED,
        trackHeight: 1,
        trackShape: const RectangularSliderTrackShape(),
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        showValueIndicator: ShowValueIndicator.always,
        valueIndicatorTextStyle: const TextStyle(color: Colors.white),
        valueIndicatorColor: RED,

      ),
      child: Slider(
        label: "${widget.sliderController.value.truncate()}",
        value: widget.sliderController.value,
        onChanged: (value){
          setState(() {
            widget.sliderController.value=value;
          });
        },
        min: 60,
        max: 250,
      ),
    );
  }
}

