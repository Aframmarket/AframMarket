import 'package:flutter/material.dart';
import '../Colors/colors.dart';
import 'UIText.dart';


class CustomDropdownField extends StatefulWidget {
  final String hintText;
  final List<Map<String, dynamic>>? items;
  final void Function(Map<String, dynamic>) onChanged;
  final TextEditingController? controller;
  final String fieldName;

  const CustomDropdownField({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.controller,
    required this.fieldName,
  }) : super(key: key);

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
              itemCount: widget.items?.length ?? 0,
              itemBuilder: (context, index) {
                final item = widget.items?[index];
                return ListTile(
                  title: Text(item?['name'] ?? ''),
                  onTap: () {
                    setState(() {
                      selectedValue = item?['name'];

                      // Store the required value in the controller
                      if (widget.controller != null) {
                        widget.controller!.text = item?['controllerValue'];
                      }

                      widget.onChanged(item!);
                    });
                    Navigator.of(context).pop();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UiText(text: widget.fieldName, textColor: Colors.black, fontSize: 14, fontWeight: FontWeight.w400,),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () => _showDropdown(context),
          child: AbsorbPointer(
            child: TextFormField(
              readOnly: true,
              validator: (value) {
                if (selectedValue == null || selectedValue!.isEmpty) {
                  return "Please select an option";
                }
                return null;
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryGreenColor,
                    style: BorderStyle.solid,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: AppColors.softWhite,
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14.0),
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                hintText: widget.hintText,
                labelText: selectedValue,
                suffixIcon: Icon(Icons.arrow_drop_down),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
