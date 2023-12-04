
import 'package:flutter/material.dart';
import 'basic_payments_page.dart';
import 'CurrencySelector.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BasicPaymentsPage()),
                );
              },
              child: const Text('Enter Salary Details'),
            ),
            const SizedBox(height: 20),
            CurrencySelector(
              onCurrencySelected: (selectedCurrency) {

                print('Selected Currency: $selectedCurrency');
              },
            ),
          ],
        ),
      ),
    );
  }
}
