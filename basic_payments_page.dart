
import 'package:flutter/material.dart';
import 'CurrencySelector.dart';
import 'salary_details_page.dart';

class BasicPaymentsPage extends StatefulWidget {
  const BasicPaymentsPage({Key? key}) : super(key: key);

  @override
  _BasicPaymentsPageState createState() => _BasicPaymentsPageState();
}

class _BasicPaymentsPageState extends State<BasicPaymentsPage> {
  TextEditingController salaryController = TextEditingController();
  TextEditingController basicPaymentsController = TextEditingController();
  String selectedCurrency = 'Dollar'; // Default currency
  bool isInsurancePaid = false; // Default value for insurance checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Basic Payments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: salaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter Your Salary'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: basicPaymentsController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Enter Basic Payments'),
            ),
            const SizedBox(height: 20),
            CurrencySelector(
              onCurrencySelected: (currency) {
                setState(() {
                  selectedCurrency = currency;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: isInsurancePaid,
                  onChanged: (value) {
                    setState(() {
                      isInsurancePaid = value ?? false;
                    });
                  },
                ),
                const Text('Is Insurance Paid?'),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SalaryDetailsPage(
                      salary: double.parse(salaryController.text),
                      basicPayments: basicPaymentsController.text,
                      selectedCurrency: selectedCurrency,
                      isInsurancePaid: isInsurancePaid,
                    ),
                  ),
                );
              },
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
