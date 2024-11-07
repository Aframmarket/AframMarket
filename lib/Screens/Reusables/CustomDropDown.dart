import 'package:flutter/material.dart';
import '../Colors/colors.dart';


class CustomDropdownField extends StatefulWidget {
  final String hintText;
  final List<Map<String, dynamic>>? items;
  final void Function(String) onChanged;
  final TextEditingController controller;

  const CustomDropdownField({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.controller,
  });

  @override
  _CustomDropdownFieldState createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? selectedValue;

  void _showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 24.0,
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: widget.items?.length,
              itemBuilder: (context, index) {
                final item = widget.items?[index];
                return ListTile(
                  title: Text(item?['name']),
                  onTap: () {
                    setState(() {
                      selectedValue = item?['name']; // Show the selected name
                      widget.controller.text = item?['id']!; // Set the controller text to the id
                      widget.onChanged(item?['name']!); // Pass the id to the onChanged callback
                      print(item?["id"]);
                    });
                    Navigator.of(context).pop(); // Close the dialog
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(context),
      child: AbsorbPointer(
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Select a state";
            }
            return null;
          },
          controller: widget.controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryGreenColor,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15)
            ),
            filled: true,
            fillColor: AppColors.softWhite,
            hintStyle: TextStyle(
                color: Colors.grey[600],
                fontSize: 14.0),
            contentPadding: EdgeInsets.symmetric(
                vertical: 20, horizontal: 15),
            hintText: selectedValue ?? widget.hintText,
            suffixIcon: Icon(Icons.arrow_drop_down),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
