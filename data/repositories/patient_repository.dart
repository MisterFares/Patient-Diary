// lib/data/repositories/patient_repository.dart
import 'package:hive/hive.dart';
import 'package:project/data/models/patient_model.dart';

class PatientRepository {
  final Box patientsBox;

  PatientRepository({required this.patientsBox});

  Future<List<Patient>> getPatients() async {
    return patientsBox.values.cast<Patient>().toList();
  }

  // In lib/data/repositories/patient_repository.dart
  Future<Patient?> getPatientById(String id) async {
    return patientsBox.get(id);
  }

  Future<void> addPatient(Patient patient) async {
    await patientsBox.put(patient.id, patient);
  }

  Future<void> updatePatient(Patient patient) async {
    await patientsBox.put(patient.id, patient);
  }

  Future<void> deletePatient(String id) async {
    await patientsBox.delete(id);
  }

  Future<Patient?> findPatientByPhone(String phoneNumber) async {
    final allPatients = await getPatients();
    return allPatients.firstWhere(
      (patient) => patient.phoneNumber == phoneNumber,
    );
  }
}
