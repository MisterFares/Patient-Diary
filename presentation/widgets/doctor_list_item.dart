import 'package:flutter/material.dart';
import 'package:project/data/models/doctor_model.dart';

class DoctorListItem extends StatelessWidget {
  final Doctor doctor;

  const DoctorListItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: doctor.avatarUrl.isNotEmpty
              ? NetworkImage(doctor.avatarUrl)
              : null,
          child: doctor.avatarUrl.isEmpty
              ? const Icon(Icons.person, color: Colors.white)
              : null,
        ),
        title: Text(
          doctor.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(doctor.specialty),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // TODO: navigate to Doctor details page
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Selected: ${doctor.name}")),
          );
        },
      ),
    );
  }
}
