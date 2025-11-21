import 'package:cairo_metro/logic.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  CustomDropdown({super.key, this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: stations
          .map((station) => DropdownMenuEntry(value: station, label: station))
          .toList(),
      enableFilter: true,
      controller: controller,
      enableSearch: true,
      requestFocusOnTap: true,
      menuHeight: 250,
      hintText: hintText,
      width: double.infinity,

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color.fromARGB(255, 225, 224, 244),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),

      // styling the dropdown menu
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          const Color.fromARGB(255, 225, 224, 244),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
