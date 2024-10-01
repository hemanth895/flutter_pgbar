import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_app/my_functions.dart';
import 'package:progress_app/controllers/my_data.dart';
import 'package:progress_app/widgets/color_picker.dart';
import 'package:progress_app/widgets/custom_progress_bar.dart';
import 'package:progress_app/widgets/custom_slider.dart';

class HomePage extends StatelessWidget {
  final MyData myData = Get.put(MyData());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 130),

              SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      buildNetworkImage(myData),
                  
                      const SizedBox(height: 2),
                  
                      // Color Picker
                      ColorPicker(myData: myData),
                      const SizedBox(height: 2),
                  
                      // Slider for Speed
                      CustomSlider(myData: myData),
                      const SizedBox(height: 2),
                  
                      // Custom Text Fields for Input
                      buildTextFields(myData),
                  
                      const SizedBox(height: 2),
                  
                      // Switch for Reverse Progress
                      buildReverseSwitch(myData),
                  
                      const SizedBox(height: 2),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Custom Progress Indicator
              Obx(
                () => CustomProgressIndicator(
                  totalItems: myData.totalItems.value,
                  itemsInLine: myData.itemsInLine.value,
                  color: myData.selectedColor.value.color,
                  isReversed: myData.isReversed.value,
                  speed: myData.selectedSpeed.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
