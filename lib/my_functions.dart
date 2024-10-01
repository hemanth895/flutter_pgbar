import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:progress_app/controllers/my_data.dart';
import 'package:progress_app/widgets/text_field.dart';

Widget buildNetworkImage(MyData myData) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          'https://i.ibb.co/dbB2qtK/2-Assymetri-White-on-black.png',
          width: double.infinity,
          height: 100,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
  );
}

Widget buildTextFields(MyData myData) {
  return Column(
    children: [
      Obx(
        () => CustomTextField(
          labelText: "Total Items",
          borderColor: myData.selectedColor.value.baseColor,
          onChanged: (value) {
            final int totalItems = int.tryParse(value) ?? 1;
            myData.updateTotalItems(totalItems);
          },
        ),
      ),
      Obx(
        () => CustomTextField(
          labelText: "Items in Line",
          borderColor: myData.selectedColor.value.baseColor,
          onChanged: (value) {
            final int items = int.tryParse(value) ?? 1;
            myData.updateItemsInLine(items);
          },
        ),
      ),
    ],
  );
}

Widget buildReverseSwitch(MyData myData) {
  return Obx(
    () => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        color: Colors.transparent,
        child: SwitchListTile(
          title: Text(
            "Reverse",
            style: TextStyle(
              fontSize: 16,
              color: myData.selectedColor.value.baseColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          value: myData.isReversed.value,
          onChanged: (value) {
            myData.toggleReverse();
          },
          activeColor: myData.selectedColor.value.baseColor,
        ),
      ),
    ),
  );
}
