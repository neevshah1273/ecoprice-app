import 'package:ecoprice/Pages/Style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ColorGradient.dart';

class FilterProductDialog extends StatefulWidget {
  const FilterProductDialog({Key? key}) : super(key: key);

  @override
  State<FilterProductDialog> createState() => _FilterProductDialogState();
}

class _FilterProductDialogState extends State<FilterProductDialog> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );;
  }
}
