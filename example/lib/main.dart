import 'package:flutter/material.dart';
import 'package:form_searchable_dropdown/form_searchable_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Searchable Dropdown Demo')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FormSearchableDropdown<String>(
              items: const ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'],
              itemLabelBuilder: (item) => item,
              onChanged: (selected) => print('Selected: $selected'),
              hintText: 'Select a fruit',
            ),
          ),
        ),
      ),
    );
  }
}
