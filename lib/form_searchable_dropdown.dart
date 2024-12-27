library form_searchable_dropdown;

import 'package:flutter/material.dart';

class FormSearchableDropdown<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T)? itemLabelBuilder;
  final ValueChanged<T?>? onChanged;
  final String hintText;
  final double? textFormHeight;
  final double? listHeight;
  final TextStyle? hintStyle;
  final InputDecoration? inputDecoration;
  final bool isCaseSensitive;
  final Widget? noResultsWidget;
  final bool showClearButton;
  final double cursorHeight;
  final Color cursorColor;
  final double borderRadius;
  final Color enabledBorderColor;
  final Icon dropdownIcon;
  final Icon dropdownOpenIcon;

  const FormSearchableDropdown({
    Key? key,
    required this.items,
    this.itemLabelBuilder,
    this.onChanged,
    this.textFormHeight,
    this.listHeight,
    this.hintText = 'Select an item',
    this.hintStyle,
    this.inputDecoration,
    this.isCaseSensitive = false,
    this.noResultsWidget,
    this.showClearButton = true,
    this.cursorHeight = 18.0,
    this.cursorColor = Colors.black,
    this.borderRadius = 4.0,
    this.enabledBorderColor = Colors.grey,
    this.dropdownIcon =
        const Icon(Icons.arrow_drop_down_outlined, color: Colors.black),
    this.dropdownOpenIcon =
        const Icon(Icons.arrow_drop_up_outlined, color: Colors.black),
  }) : super(key: key);

  @override
  _FormSearchableDropdownState<T> createState() => _FormSearchableDropdownState<T>();
}

class _FormSearchableDropdownState<T> extends State<FormSearchableDropdown<T>> {
  late TextEditingController searchController;
  late List<T> _filteredItems;
  T? _selectedItem;
  bool isDropdownOpen = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _filteredItems = widget.items;
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = widget.items.where((item) {
        final itemLabel =
            widget.itemLabelBuilder?.call(item) ?? item.toString();
        return widget.isCaseSensitive
            ? itemLabel.contains(query)
            : itemLabel.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.textFormHeight ?? 60,
          child: TextFormField(
            enabled: true,
            controller: searchController,
            onTap: () {
              setState(() {
                isDropdownOpen = !isDropdownOpen;
              });
            },
            focusNode: focusNode,
            onChanged: (value) => _filterItems(value),
            cursorHeight: widget.cursorHeight,
            cursorColor: widget.cursorColor,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isDropdownOpen = !isDropdownOpen;
                  });
                },
                icon: isDropdownOpen
                    ? widget.dropdownOpenIcon
                    : widget.dropdownIcon,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.enabledBorderColor,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.enabledBorderColor,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
          ),
        ),
        if (isDropdownOpen)
          Container(
            height: widget.listHeight ?? 200,
            decoration: BoxDecoration(
              border: Border.all(color: widget.enabledBorderColor),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final item = _filteredItems[index];
                return ListTile(
                  title: Text(
                    widget.itemLabelBuilder?.call(item) ?? item.toString(),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedItem = item;
                      searchController.text =
                          widget.itemLabelBuilder?.call(item) ??
                              item.toString();
                      isDropdownOpen = false;
                    });
                    widget.onChanged?.call(item);
                  },
                );
              },
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
