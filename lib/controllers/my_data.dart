import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ColorModel class to hold color values and names
class ColorModel {
  final Color color;
  final String name;

  ColorModel(this.color, this.name);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ColorModel &&
        other.color == color; // Compare based on color
  }

  @override
  int get hashCode => color.hashCode; // Hash code based on color
}

enum Speed {
  slow,
  smooth,
  fast,
}

class MyData extends GetxController {
  // Observable variables for state management
  var itemsInLine = 1.obs; // Input for items in line
  var totalItems = 1.obs; // Input for total items
  var isReversed = false.obs; // Switch for reversing progress
  var selectedSpeed = Speed.slow.obs; // Observable for speed selection

  var sliderValue = 0.5.obs;

  // Make selectedColor an observable and set the initial color to green
  var selectedColor =
      ColorModel(Colors.green, 'Green').obs; // Initial color for the text field

  // Predefined color options for the color picker
  List<ColorModel> colorOptions = [
    ColorModel(Colors.green, 'Green'),
    ColorModel(Colors.blue, 'Blue'),
    ColorModel(const Color.fromARGB(255, 133, 18, 10), 'Red'),
    ColorModel(Colors.purple, 'Purple'),
  ];

  // Methods for updating observable values

  void updateSliderValue(double value) {
    if (value < 0.5) {
      selectedSpeed.value = Speed.slow;
    } else if (value == 0.5) {
      selectedSpeed.value = Speed.smooth;
    } else {
      selectedSpeed.value = Speed.fast;
    }
    sliderValue.value = value;
  }

  void updateItemsInLine(int value) {
    itemsInLine.value = value;
  }

  void updateTotalItems(int value) {
    totalItems.value = value;
  }

  void toggleReverse() {
    isReversed.value = !isReversed.value;
  }

  // Method to reset all values if needed
  void resetValues() {
    selectedColor.value = ColorModel(Colors.green, 'Green'); // Reset to green
    sliderValue.value = 0.5;
    itemsInLine.value = 1;
    totalItems.value = 1;
    isReversed.value = false;
    selectedSpeed.value = Speed.slow; // Reset to slow speed
  }

  // Method to update the selected color
  void updateSelectedColor(ColorModel colorModel) {
    selectedColor.value = colorModel;
  }

  // Method to update the selected speed
  void updateSelectedSpeed(Speed speed) {
    selectedSpeed.value = speed;
  }
}
