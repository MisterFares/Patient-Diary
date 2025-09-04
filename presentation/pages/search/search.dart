// lib/presentation/pages/search/search.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/presentation/pages/appointments/appointments_upcoming.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: AppConstants.primaryColor,
        title: const SearchBar(),
      ),
      body: const SearchResults(),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffix: const Icon(Icons.search, color: AppConstants.primaryColor),
          hintText: 'Search Appointments',
          hintStyle: const TextStyle(
            color: AppConstants.textTertiary,
            fontFamily: AppConstants.fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Results'),
        const SizedBox(height: 15),
        Expanded(
          child: ListView(
            children: const [
              AppointmentListItem(
                name: 'Pooja Rohila',
                age: '32 years',
                time: '4.00 PM',
                statusColor: AppConstants.primaryColor,
              ),
              AppointmentListItem(
                name: 'Poonam Bhatt',
                age: '24 years',
                time: '5.00 PM',
                statusColor: AppConstants.primaryColor,
              ),
              AppointmentListItem(
                name: 'Poornima Rey',
                age: '52 years',
                time: '12.00 PM',
                statusColor: AppConstants.primaryColor,
              ),
              AppointmentListItem(
                name: 'Poorvi Sager',
                age: '37 years',
                time: '12.30 PM',
                statusColor: AppConstants.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}