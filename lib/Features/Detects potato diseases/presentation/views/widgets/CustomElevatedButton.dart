
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed; // Callback for button press
  final String buttonText; // Text to display on the button

  // Constructor
  const CustomElevatedButton({super.key, required this.onPressed, this.buttonText = 'Upload Image'});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Use the passed callback
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff733B3A), // Background color
        fixedSize: const Size(double.infinity, 50), // Button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(
            width: 12.5,
          ),
          const Icon(
            Icons.upload,
            color: Colors.white,
          ),

        ],
      ),
    );
  }
}