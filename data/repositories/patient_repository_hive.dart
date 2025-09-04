// lib/data/repositories/patient_repository_hive.dart
import 'package:hive/hive.dart';
import 'package:project/data/models/patient_model.dart';
import 'package:project/data/repositories/patient_repository.dart';

class PatientRepositoryHive implements PatientRepository {
  final Box<Patient> patientsBox;

  PatientRepositoryHive({required this.patientsBox});

  @override
  Future<List<Patient>> getPatients() async {
    return patientsBox.values.toList();
  }

  @override
  Future<Patient> getPatientById(String id) async {
    return patientsBox.get(id)!;
  }

  @override
  Future<void> addPatient(Patient patient) async {
    await patientsBox.put(patient.id, patient);
  }

  @override
  Future<void> updatePatient(Patient patient) async {
    await patientsBox.put(patient.id, patient);
  }

  @override
  Future<void> deletePatient(String id) async {
    await patientsBox.delete(id);
  }

  @override
  Future<Patient?> findPatientByPhone(String phoneNumber) {
    // TODO: implement findPatientByPhone
    throw UnimplementedError();
  }
}
