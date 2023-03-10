import 'package:flutter/material.dart';
import 'package:flutter_practice/core/repositories/data.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/widgets/text.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    required this.items,
    Key? key,
  }) : super(key: key);

  final List<String> items;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  // The currently selected item in the dropdown menu
  late String _selectedItem;

  @override
  void initState() {
    super.initState();
    // Initialize the selected item to be the first item in the dropdown list
    _selectedItem = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 21,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          // Set the background color of the dropdown container
          color: MPTheme.lightTheme.colorScheme.background,
          // Set the color and width of the border
          border: Border.all(
              color: MPTheme.lightTheme.colorScheme.onSurface, width: 1),
          // Set the border radius to make the edges of the container rounded
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButton(
          // Set the value of the dropdown button to be the currently selected item
          value: _selectedItem,
          // Map the items in the dropdown list to dropdown menu items
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              // Set the child of the dropdown menu item to be a SmallBody widget with the current item's text
              child: SmallBody(
                text: value,
                // Set the text color of the dropdown menu item to be the color scheme's onSurface color
                color: MPTheme.lightTheme.colorScheme.onSurface,
                hasUpperCase: false,
              ),
            );
          }).toList(),
          // Set the function to call when a dropdown menu item is selected
          onChanged: (value) {
            setState(() {
              // Set the currently selected item to be the item that was just selected
              _selectedItem = value!;
            });

            // Set the selected app or category based on which dropdown menu is being used
            if (widget.items.first == 'Twitter') {
              appSelected = _selectedItem;
            } else {
              categorySelected = _selectedItem;
            }
          },
          // Remove the underline from the dropdown button
          underline: const SizedBox(),
          // Add an arrow icon to the dropdown button
          icon: const Icon(Icons.arrow_drop_down),
          // Set the font size of the dropdown button text
          style: const TextStyle(fontSize: 16),
          // Expand the dropdown button to fit its container
          isExpanded: true,
        ),
      ),
    );
  }
}
