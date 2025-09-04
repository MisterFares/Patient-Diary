// lib/data/repositories/doctor_repository.dart
import 'package:hive/hive.dart';
import 'package:project/data/models/doctor_model.dart';

class DoctorRepository {
  final Box doctorsBox;

  DoctorRepository({required this.doctorsBox});

  Future<List<Doctor>> getDoctors() async {
    return doctorsBox.values.cast<Doctor>().toList();
  }

  Future<Doctor?> getDoctorById(String id) async {
    return doctorsBox.get(id);
  }

  Future<List<Doctor>> getDoctorsBySpecialty(String specialty) async {
    final allDoctors = await getDoctors();
    if (specialty == 'All') return allDoctors;
    return allDoctors.where((doctor) => doctor.specialty == specialty).toList();
  }

  Future<List<String>> getSpecialties() async {
    final allDoctors = await getDoctors();
    final specialties = allDoctors.map((doctor) => doctor.specialty).toSet().toList();
    specialties.insert(0, 'All');
    return specialties;
  }
}