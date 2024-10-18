import 'dart:io';

// Patient Class
class Patient {
  String name;
  int age;
  String healthIssue;

  Patient(this.name, this.age, this.healthIssue);

  void showDetails() {
    print('Patient Name: $name');
    print('Age: $age');
    print('Health Issue: $healthIssue');
  }
}

// Doctor Class
class Doctor {
  String name;
  String specialty;
  bool isAvailable;

  Doctor(this.name, this.specialty, this.isAvailable);

  void showDetails() {
    print('Doctor Name: $name');
    print('Specialty: $specialty');
    print('Available: ${isAvailable ? 'Yes' : 'No'}');
  }
}

// Appointment Class
class Appointment {
  Patient patient;
  Doctor doctor;
  String appointmentDate;

  Appointment(this.patient, this.doctor, this.appointmentDate);

  void showDetails() {
    print('Appointment Details:');
    patient.showDetails();
    doctor.showDetails();
    print('Appointment Date: $appointmentDate');
  }
}

// Hospital Management System
class Hospital {
  List<Doctor> doctors = [];
  List<Patient> patients = [];
  List<Appointment> appointments = [];

  void registerPatient() {
    stdout.write('Enter Patient Name: ');
    String? name = stdin.readLineSync();

    stdout.write('Enter Patient Age: ');
    int age = int.parse(stdin.readLineSync()!);

    stdout.write('Enter Health Issue: ');
    String? healthIssue = stdin.readLineSync();

    var newPatient = Patient(name!, age, healthIssue!);
    patients.add(newPatient);
    print('Patient Registered Successfully.\n');
  }

  void registerDoctor() {
    stdout.write('Enter Doctor Name: ');
    String? name = stdin.readLineSync();

    stdout.write('Enter Specialty: ');
    String? specialty = stdin.readLineSync();

    stdout.write('Is the Doctor Available? (yes/no): ');
    String? availabilityInput = stdin.readLineSync();
    bool isAvailable = availabilityInput?.toLowerCase() == 'yes';

    var newDoctor = Doctor(name!, specialty!, isAvailable);
    doctors.add(newDoctor);
    print('Doctor Registered Successfully.\n');
  }

  void scheduleAppointment() {
    if (patients.isEmpty) {
      print('No patients registered yet.');
      return;
    }
    if (doctors.isEmpty) {
      print('No doctors available for appointment.');
      return;
    }

    print('\nSelect a Patient:');
    for (int i = 0; i < patients.length; i++) {
      print('${i + 1}. ${patients[i].name}');
    }

    stdout.write('Enter patient number: ');
    int patientIndex = int.parse(stdin.readLineSync()!) - 1;

    print('\nAvailable Doctors:');
    for (int i = 0; i < doctors.length; i++) {
      if (doctors[i].isAvailable) {
        print('${i + 1}. Dr. ${doctors[i].name} (${doctors[i].specialty})');
      }
    }

    stdout.write('Enter doctor number: ');
    int doctorIndex = int.parse(stdin.readLineSync()!) - 1;

    stdout.write('Enter Appointment Date (e.g., 2024-10-20): ');
    String? appointmentDate = stdin.readLineSync();

    var appointment = Appointment(patients[patientIndex], doctors[doctorIndex], appointmentDate!);
    appointments.add(appointment);
    print('Appointment Scheduled Successfully.\n');
  }

  void showAllAppointments() {
    if (appointments.isEmpty) {
      print('No appointments scheduled yet.');
      return;
    }

    print('\nScheduled Appointments:');
    for (var appointment in appointments) {
      appointment.showDetails();
      print('-----------------------------');
    }
  }
}
