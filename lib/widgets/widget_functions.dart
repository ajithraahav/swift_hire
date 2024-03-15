import 'package:flutter/material.dart';

class WidgetFunctions {
  InputDecoration textFormFieldDecoration(String? placeHolder,
      {Widget? prefixIcon, Widget? suffixIcon}) {
    return InputDecoration(
        prefixIconColor: Color(0xFF6B50F6),
        // prefixIconColor: Colors.black54,
        errorStyle: const TextStyle(color: Colors.red, fontSize: 10),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        isDense: true,
        labelStyle: const TextStyle(
            decoration: TextDecoration.none, overflow: TextOverflow.ellipsis),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
          overflow: TextOverflow.ellipsis,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        hintText: placeHolder,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon);
  }

  BoxDecoration boxDecoration({Color? bgColor}) {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 10,
          spreadRadius: 0.1,
          offset: const Offset(0.0, 0.6),
        )
      ],
      borderRadius: BorderRadius.circular(10),
      color: bgColor ?? Colors.transparent,
    );
  }

  showPopupMessage(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon at the top
                const Icon(Icons.beenhere_rounded, size: 60, color: Colors.green),
                const SizedBox(height: 16),
                // Title
                Text(message, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 16),
                // Additional content or message
                const Text('Your message here.'),
                const SizedBox(height: 16),
                // Buttons at the bottom
                ButtonBar(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle button press
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle button press
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
