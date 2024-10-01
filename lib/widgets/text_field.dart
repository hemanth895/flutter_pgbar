import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText; 
  final Color borderColor; 
  final Function(String) onChanged; 

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
      ), 
      child: TextField(
        keyboardType: TextInputType.number,
        style: TextStyle(color: borderColor),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 14,
            color: borderColor, 
            fontWeight: FontWeight.w600
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black54, 
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor), 
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: borderColor), 
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: borderColor), 
          ),
          contentPadding:
              const EdgeInsets.fromLTRB(12, 24, 12, 12), 
        ),
      ),
    );
  }
}
