import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/colors.dart';

class CustomEmailField extends StatefulWidget {
  final TextEditingController controllerText;
  final String hintText;
  final String validationMessage;
  final String fieldName;


  const CustomEmailField({
    super.key,
    required this.controllerText,
    required this.hintText,
    required this.validationMessage,
    required this.fieldName});

  @override
  State<CustomEmailField> createState() => _CustomEmailFieldState();
}

class _CustomEmailFieldState extends State<CustomEmailField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text(
              widget.fieldName,
              style: GoogleFonts.sen(
                color: Colors.black,
                textStyle: Theme.of(context)
                    .textTheme
                    .displayLarge,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: widget.controllerText,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: widget.hintText,
                filled: true,
                fillColor: AppColors.softWhite,
                contentPadding: EdgeInsets.symmetric(
                    vertical: 20, horizontal: 15),
                hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryGreenColor,
                      style: BorderStyle.solid,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(15)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryGreenColor,
                      style: BorderStyle.solid,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return widget.validationMessage;
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              cursorColor: AppColors.primaryGreenColor,
            )
          ]
      ),
    );
  }
}
