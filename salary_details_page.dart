
import 'package:flutter/material.dart';

class SalaryDetailsPage extends StatelessWidget {
  final double salary;
  final String basicPayments;
  final String selectedCurrency;
  final bool isInsurancePaid;

  const SalaryDetailsPage({
    Key? key,
    required this.salary,
    required this.basicPayments,
    required this.selectedCurrency,
    required this.isInsurancePaid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double remainingSalary = calculateRemainingSalary();
    double dailySpendingLimit = remainingSalary / 30;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Management'),
      ),
      body: Container(
        color: Colors.blueGrey,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Remaining Salary: $remainingSalary $selectedCurrency'),
            Text('Daily Spending Limit: $dailySpendingLimit $selectedCurrency'),
            Text('Selected Currency: $selectedCurrency'),
            if (!isInsurancePaid)
              const Text(
                'Note: 20% has been deducted to cover insurance.',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }

  double calculateRemainingSalary() {
    double remainingSalary = salary - calculateBasicPaymentsValue(basicPayments);

    if (!isInsurancePaid) {
      // Deduct 10% if insurance is not paid
      remainingSalary -= (0.2 * salary);
    }

    return remainingSalary;
  }

  double calculateBasicPaymentsValue(String basicPayments) {
    List<String> paymentsList = basicPayments.split(',');
    double totalValue = 0;

    for (String payment in paymentsList) {
      totalValue += double.parse(payment.trim());
    }

    return totalValue;
  }
}
