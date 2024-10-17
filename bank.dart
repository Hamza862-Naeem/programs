import 'dart:io';

class Bank {
  double balance = 0.0;

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
  var bank = Bank();
  bool exit = false;

  while (!exit) {
    print('\nBanking System Menu:');
    print('1. Check Balance');
    print('2. Deposit');
    print('3. Withdraw');
    print('4. Exit');
    stdout.write('Select an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        bank.checkBalance();
        break;
      case '2':
        bank.deposit();
        break;
      case '3':
        bank.withdraw();
        break;
      case '4':
        exit = true;
        print('Exiting the banking system. Goodbye!');
        break;
      default:
        print('Invalid option, please select again.');
    }
  }
}
