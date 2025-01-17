# SearchableDropdown

`SearchableDropdown` is a highly customizable Flutter package that provides a searchable dropdown menu for selecting items from a list. It simplifies building user-friendly and feature-rich dropdowns with filtering capabilities useful for transactional data .

## Features

- **Search Functionality**: Easily filter items in the dropdown using a search bar.
- **Customizable UI**: Configure hint text, icons, borders, cursor styles, and more.
- **Case-Sensitivity Option**: Toggle case sensitivity in search.
- **Clear Button Support**: Optionally show a clear button to reset the selection.
- **Handles No Results**: Display a widget when no matching results are found.
---

<Table>
    <tr>
        <td><img src="https://ik.imagekit.io/sudeeptiV/form_searchable_dropdown/search_in_dropdown.gif?updatedAt=1735628076254" alt="preview2"/></td>
<td><img src="https://ik.imagekit.io/sudeeptiV/form_searchable_dropdown/seacheable_dropdown.gif?updatedAt=1735628076191" alt="preview"/></td>
   <td><h1></h1></td>
    </tr>
</Table>

---

## Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  form_searchable_dropdown: 1.0.2
```

Then run:

```sh
flutter pub get
```

## Usage

Here's an example of how to use `SearchableDropdown` in your Flutter app:

```dart
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
            child: SearchableDropdown<String>(
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

```

## Parameters

### Required Parameters:
- **`items`**: A list of items to display in the dropdown.
- **`itemLabelBuilder`**: A function to define how items are displayed as text.

### Optional Parameters:
- **`onChanged`**: Callback function triggered when an item is selected.
- **`hintText`**: Placeholder text for the dropdown.
- **`textFormHeight`**: Height of the text form field.
- **`listHeight`**: Height of the dropdown list.
- **`hintStyle`**: Text style for the placeholder text.
- **`inputDecoration`**: Custom input decoration for the text form field.
- **`isCaseSensitive`**: Whether the search should be case-sensitive (default: `false`).
- **`noResultsWidget`**: Widget displayed when no search results are found.
- **`showClearButton`**: Whether to show a button to clear the search field (default: `true`).
- **`cursorHeight`**: Height of the cursor in the text form field (default: `18.0`).
- **`cursorColor`**: Color of the cursor (default: `Colors.black`).
- **`borderRadius`**: Border radius for the input field and dropdown (default: `4.0`).
- **`enabledBorderColor`**: Color of the border when the field is enabled (default: `Colors.grey`).
- **`dropdownIcon`**: Icon displayed when the dropdown is closed (default: `Icons.arrow_drop_down_outlined`).
- **`dropdownOpenIcon`**: Icon displayed when the dropdown is open (default: `Icons.arrow_drop_up_outlined`).

## Contributing

Contributions are welcome! Please submit issues and pull requests on the [GitHub repository](https://github.com/sudeeptiV/form_searchable_dropdown.git).

