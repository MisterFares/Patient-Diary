// lib/presentation/pages/doctors/doctor_search.dart
import 'package:flutter/material.dart';
import 'package:project/core/services/local_storage_service.dart';
import 'package:project/data/models/doctor_model.dart';
import 'package:project/presentation/widgets/doctor_list_item.dart';

class DoctorSearchScreen extends StatefulWidget {
  const DoctorSearchScreen({super.key});

  @override
  State<DoctorSearchScreen> createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedSpecialty = 'All';
  List<Doctor> _filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    _loadDoctors();
  }

  Future<void> _loadDoctors() async {
    final doctorsBox = LocalStorageService.doctorsBox;
    final allDoctors = doctorsBox.values.cast<Doctor>().toList();
    setState(() {
      _filteredDoctors = allDoctors;
    });
  }

  void _filterDoctors() {
    final doctorsBox = LocalStorageService.doctorsBox;
    final allDoctors = doctorsBox.values.cast<Doctor>().toList();
    
    setState(() {
      _filteredDoctors = allDoctors.where((doctor) {
        final matchesSearch = _searchController.text.isEmpty ||
            doctor.name.toLowerCase().contains(_searchController.text.toLowerCase()) ||
            doctor.specialty.toLowerCase().contains(_searchController.text.toLowerCase());
        
        final matchesSpecialty = _selectedSpecialty == 'All' || 
            doctor.specialty == _selectedSpecialty;
        
        return matchesSearch && matchesSpecialty;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Doctors'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterBottomSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search doctors...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) => _filterDoctors(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDoctors.length,
              itemBuilder: (context, index) {
                final doctor = _filteredDoctors[index];
                return DoctorListItem(doctor: doctor);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet() {
    // Implement filter bottom sheet
  }
}