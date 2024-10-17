import 'dart:io';

import 'loanBank.dart';

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
}
void main() {
  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();
  String correctPassword = '1234'; 
  int maxAttempts = 3; 
  bool accessGranted = false;

  for (int attempts = 0; attempts < maxAttempts; attempts++) {
    stdout.write('Enter your password: ');
    String? inputPassword = stdin.readLineSync();

    if (inputPassword == correctPassword) {
      accessGranted = true;
      print('Access granted.\n');
      break;
    } else {
      print('Incorrect password. Try again.');
    }
  }

  if (!accessGranted) {
    print('Too many failed attempts. Exiting...');
    return; 
  }

  stdout.write('Enter account type (savings/current): ');
  String? accountType = stdin.readLineSync();

  if (accountType != "savings" && accountType != "current") {
    print('Invalid account type. Exiting...');
    return;
  }

  var loanBank = LoanBank(accountType!);

  bool exit = false;

  while (!exit) {
    print('\nBanking System Menu:');
    print('1. Check Balance');
    print('2. Deposit');
    print('3. Withdraw');
    print('4. Interest calculation');
    print('5. Loan Eligibility Check');
    print('6. Exit');
    stdout.write('Select an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        loanBank.checkBalance();
        break;
      case '2':
        loanBank.deposit();
        break;
      case '3':
        loanBank.withdraw();
        break;
      case '4':
        loanBank.calculateInterest();
        break;
      case '5':
        loanBank.checkLoanEligibility();
        break;
      case '6':
        exit = true;
        print('Exiting the banking system. Goodbye! $name');
        break;
      default:
        print('Invalid option, please select again.');
    }
  }
}
