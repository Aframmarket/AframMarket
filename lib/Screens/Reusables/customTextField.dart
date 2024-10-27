import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Colors/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controllerText;
  final String hintText;
  final String validationMessage;
  final String fieldName;
  final bool showIcon;
  final bool readOnly;

  const CustomTextField(
      {super.key,
      required this.controllerText,
      required this.hintText,
      required this.validationMessage,
      required this.fieldName,
      required this.showIcon, required this.readOnly});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.fieldName,
          style: GoogleFonts.sen(
            color: Colors.black,
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: widget.controllerText,
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            suffixIcon: widget.showIcon
                ? Icon(
                    Icons.remove_red_eye_rounded,
                    color: AppColors.softIconColor,
                  )
                : SizedBox(),
            hintText: widget.hintText,
            filled: true,
            fillColor: AppColors.softWhite,
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14.0),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryGreenColor,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryGreenColor,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return widget.validationMessage;
            }
            return null;
          },
          cursorColor: AppColors.primaryGreenColor,
        )
      ]),
    );
  }
}
