import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final Function(String)? onSubmitted;
  // final bool? decimal;
  final TextInputType? keyboardType;

  AdaptativeTextField({
    this.label,
    required this.controller,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              placeholder: label,
              // keyboardType: decimal!
              //     ? const TextInputType.numberWithOptions(decimal: true)
              //     : TextInputType.text,
              keyboardType: keyboardType,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 6,
              ),
            ),
          )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(labelText: label),
            // keyboardType: decimal!
            //     ? const TextInputType.numberWithOptions(decimal: true)
            //     : TextInputType.text,
            keyboardType: keyboardType,
          );
  }
}
