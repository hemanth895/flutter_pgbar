import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_app/controllers/my_data.dart';

class ColorPicker extends StatelessWidget {
  final MyData myData;

  const ColorPicker({super.key, required this.myData});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final selectedColor = myData.selectedColor.value;

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: DropdownButton<ColorModel>(
                value: selectedColor,
                onChanged: (ColorModel? newValue) {
                  if (newValue != null) {
                    myData.updateSelectedColor(newValue);
                  }
                },
                icon: Transform.rotate(
                  angle: 1.5708, // +90 degrees in radians
                  child: const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                ),
                underline: Container(),
                isExpanded: true,
                dropdownColor: Colors.white,
                elevation: 5,
                selectedItemBuilder: (BuildContext context) {
                  return myData.colorOptions
                      .map<Widget>((ColorModel colorModel) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        selectedColor.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }).toList();
                },
                items: myData.colorOptions.map((ColorModel colorModel) {
                  return DropdownMenuItem<ColorModel>(
                    value: colorModel,
                    child: Text(colorModel.name),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
