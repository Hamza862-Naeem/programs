



import 'dart:io';

import 'hospital.dart';

void main() {
  var hospital = Hospital();
  bool exit = false;

  while (!exit) {
    print('\nHospital Management System Menu:');
    print('1. Register Patient');
    print('2. Register Doctor');
    print('3. Schedule Appointment');
    print('4. Show All Appointments');
    print('5. Exit');
    stdout.write('Select an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        hospital.registerPatient();
        break;
      case '2':
        hospital.registerDoctor();
        break;
      case '3':
        hospital.scheduleAppointment();
        break;
      case '4':
        hospital.showAllAppointments();
        break;
      case '5':
        exit = true;
        print('Exiting the Hospital Management System.');
        break;
      default:
        print('Invalid option, please select again.');
    }
  }
}






// import 'dart:io';

// import 'Bank.dart';

// void main() {
//   stdout.write('Enter your name: ');
//   String? name = stdin.readLineSync();
//   String correctPassword = '1234'; 
//   int maxAttempts = 3; 
//   bool accessGranted = false;

//   for (int attempts = 0; attempts < maxAttempts; attempts++) {
//     stdout.write('Enter your password: ');
//     String? inputPassword = stdin.readLineSync();

//     if (inputPassword == correctPassword) {
//       accessGranted = true;
//       print('Access granted.\n');
//       break;
//     } else {
//       print('Incorrect password. Try again.');
//     }
//   }

//   if (!accessGranted) {
//     print('Too many failed attempts. Exiting...');
//     return; 
//   }

//   stdout.write('Enter account type (savings/current): ');
//   String? accountType = stdin.readLineSync();

//   if (accountType != "savings" && accountType != "current") {
//     print('Invalid account type. Exiting...');
//     return;
//   }

//   var loanBank = LoanBank(accountType!);
//   var anotherAccount = Bank('savings'); // Another bank account for fund transfer

//   bool exit = false;

//   while (!exit) {
//     print('\nBanking System Menu:');
//     print('1. Check Balance');
//     print('2. Deposit');
//     print('3. Withdraw');
//     print('4. Interest calculation');
//     print('5. Loan Eligibility Check');
//     print('6. Transfer Funds');
//     print('7. Exit');
//     stdout.write('Select an option: ');

//     String? choice = stdin.readLineSync();

//     switch (choice) {
//       case '1':
//         loanBank.checkBalance();
//         break;
//       case '2':
//         loanBank.deposit();
//         break;
//       case '3':
//         loanBank.withdraw();
//         break;
//       case '4':
//         loanBank.calculateInterest();
//         break;
//       case '5':
//         loanBank.checkLoanEligibility();
//         break;
//       case '6':
//         stdout.write('Enter amount to transfer: ');
//         double transferAmount = double.parse(stdin.readLineSync()!);
//         loanBank.transferFunds(anotherAccount, transferAmount);
//         break;
//       case '7':
//         exit = true;
//         print('Exiting the banking system. Goodbye! $name');
//         break;
//       default:
//         print('Invalid option, please select again.');
//     }
//   }
// }
