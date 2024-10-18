import 'dart:io';

import 'main.dart';

class Bank {
  double balance = 100.0;
  double interestRate = 0.05; // 5% annual interest
  String accountType; // "savings" or "current"

  Bank(this.accountType);

  void calculateInterest() {
    if (accountType == "savings") {
      stdout.write('Enter the number of years to calculate interest: ');
      int years = int.parse(stdin.readLineSync()!);

      if (years >= 1) {
        double interest = balance * interestRate * years;
        print('Interest earned in $years years: \$${interest.toStringAsFixed(2)}');
      } else {
        print('Interest can only be calculated for one year or more.');
      }
    } else {
      print('Interest calculation is only applicable to savings accounts.');
    }
  }

  void checkBalance() {
    print('Your current balance is \$${balance.toStringAsFixed(2)}');
  }

  void deposit() {
    stdout.write('Enter amount to deposit: ');
    double depositAmount = double.parse(stdin.readLineSync()!);
    if (depositAmount > 0) {
      balance += depositAmount;
      print('You have deposited \$${depositAmount.toStringAsFixed(2)}');
    } else {
      print('Deposit amount must be positive.');
    }
  }

  void withdraw() {
    stdout.write('Enter amount to withdraw: ');
    double withdrawAmount = double.parse(stdin.readLineSync()!);

    if (withdrawAmount <= balance && withdrawAmount > 0) {
      balance -= withdrawAmount;
      print('You have withdrawn \$${withdrawAmount.toStringAsFixed(2)}');
    } else if (withdrawAmount <= 0) {
      print('Withdrawal amount must be positive.');
    } else {
      print('Insufficient balance. Your current balance is \$${balance.toStringAsFixed(2)}');
    }
  }


  void transferFunds(Bank targetAccount, double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      targetAccount.balance += amount;
      print('Successfully transferred \$${amount.toStringAsFixed(2)} to another account.');
    } else if (amount <= 0) {
      print('Transfer amount must be positive.');
    } else {
      print('Insufficient balance for this transfer.');
    }
  }
}

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
