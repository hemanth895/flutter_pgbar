import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:progress_app/controllers/my_data.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.myData,
  });

  final MyData myData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Obx(() {
        String currentSliderValue;
        if (myData.sliderValue.value < 0.5) {
          currentSliderValue = "Slow";
        } else if (myData.sliderValue.value == 0.5) {
          currentSliderValue = "Smooth";
        } else {
          currentSliderValue = "Fast";
        }

        return Slider(
          value: myData.sliderValue.value,
          min: 0,
          max: 1,
          divisions: 2,
          activeColor: myData.selectedColor.value.baseColor,
          onChanged: (value) {
            myData.updateSliderValue(value); 
          },
          label: currentSliderValue,
        );
      }),
    );
  }
}
