import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorModel {
  final Color color;
  final String name;
  final Color baseColor;

  const ColorModel(this.color, this.name, this.baseColor);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ColorModel &&
        other.color == color &&
        other.name == name &&
        other.baseColor == baseColor;
  }

  @override
  int get hashCode => color.hashCode ^ name.hashCode ^ baseColor.hashCode;
}

enum Speed {
  slow,
  smooth,
  fast,
}

class MyData extends GetxController {
  var itemsInLine = 1.obs; 
  var totalItems = 1.obs; 
  var isReversed = false.obs; 
  var selectedSpeed = Speed.slow.obs;

  var sliderValue = 0.5.obs;

  List<ColorModel> colorOptions = [
    const ColorModel(Color.fromARGB(242, 12, 71, 14), 'Green', Colors.green),
    const ColorModel(Color.fromARGB(255, 5, 79, 139), 'Blue', Color.fromARGB(255, 77, 151, 212)),
    const ColorModel(Color.fromARGB(255, 131, 18, 10), 'Red',
        Color.fromARGB(255, 176, 86, 66)),
    const ColorModel(Color.fromARGB(255, 22, 7, 155), 'Purple',
        Color.fromARGB(255, 80, 68, 190)),
  ];

  late Rx<ColorModel> selectedColor;

  @override
  void onInit() {
    super.onInit();
    selectedColor = colorOptions.first.obs;
  }

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

  void resetValues() {
    selectedColor.value = colorOptions.first;
    sliderValue.value = 0.5;
    itemsInLine.value = 1;
    totalItems.value = 1;
    isReversed.value = false;
    selectedSpeed.value = Speed.slow;
  }

  void updateSelectedColor(ColorModel colorModel) {
    selectedColor.value = colorModel;
  }

  void updateSelectedSpeed(Speed speed) {
    selectedSpeed.value = speed;
  }
}
