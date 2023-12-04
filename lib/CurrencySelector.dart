
import 'package:flutter/material.dart';

class CurrencySelector extends StatefulWidget {
  final Function(String) onCurrencySelected;

  const CurrencySelector({Key? key, required this.onCurrencySelected}) : super(key: key);

  @override
  _CurrencySelectorState createState() => _CurrencySelectorState();
}

class _CurrencySelectorState extends State<CurrencySelector> {
  String selectedCurrency = 'Dollar'; // Default currency

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCurrency,
      onChanged: (String? newValue) {
        setState(() {
          selectedCurrency = newValue!;
          widget.onCurrencySelected(selectedCurrency);
        });
      },
      items: <String>['Dollar', 'Euro', 'Lebanese Liras', 'Yen']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
