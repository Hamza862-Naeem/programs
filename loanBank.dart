import 'dart:io';

import 'bank.dart';

class LoanBank extends Bank {
  bool previousHistory;
  double customerWorth;

  LoanBank(String accountType)
      : previousHistory = false, // Default values, will be updated later
        customerWorth = 0.0,
        super(accountType);

  void checkLoanEligibility() {
    // Prompt for previous history
    stdout.write('Do you have a good credit history? (yes/no): ');
    String? historyInput = stdin.readLineSync();
    previousHistory = historyInput?.toLowerCase() == 'yes';

    // Prompt for financial worth
    stdout.write('Enter your financial worth: ');
    customerWorth = double.parse(stdin.readLineSync()!);

    // Loan eligibility logic
    if (previousHistory && customerWorth > 50000) {
      print('Congratulations! You are eligible for a loan.');
    } else {
      print('Sorry, you are not eligible for a loan.');
    }
  }
}
