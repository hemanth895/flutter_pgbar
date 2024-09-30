import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText; // Hint text to display
  final Color borderColor; // Color for the border
  final Function(String) onChanged; // Callback for onChanged event

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.borderColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ), // Margin for spacing
      child: TextField(
        keyboardType: TextInputType.number,
        style: TextStyle(color: borderColor),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 16,
            color: borderColor, // Color for the label text
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black54, // Color for the hint text
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor), // Set border color
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: borderColor), // Set focused border color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: borderColor), // Set enabled border color
          ),
          contentPadding:
              const EdgeInsets.fromLTRB(12, 24, 12, 12), // Padding for top-left
        ),
      ),
    );
  }
}
