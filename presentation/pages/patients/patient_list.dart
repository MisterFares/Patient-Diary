// lib/presentation/pages/patients/patient_list.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';

class PatientListScreen extends StatelessWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const PatientListAppBar(),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: const PatientListContent(),
    );
  }
}

class PatientListAppBar extends StatelessWidget {
  const PatientListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Patient List',
          style: TextStyle(
            color: Colors.white,
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                _showFilterBottomSheet(context);
              },
              icon: Image.asset(
                'assets/images/filter.png',
                width: 26,
                height: 22,
              ),
            ),
            const Icon(Icons.search, color: Colors.white),
          ],
        ),
      ],
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const FilterBottomSheet(),
    );
  }
}

class PatientListContent extends StatelessWidget {
  const PatientListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: const [
              PatientListItem(name: 'Aarav Rana', age: '24 years'),
              PatientListItem(name: 'Abhishek Shah', age: '27 years'),
              PatientListItem(name: 'Anamika Bleht', age: '26 years'),
              PatientListItem(name: 'Ankit Das', age: '28 years'),
              PatientListItem(name: 'Anuska Patwal', age: '25 years'),
              PatientListItem(name: 'Bhaskar Lohni', age: '40 years'),
              PatientListItem(name: 'Bhiemah Ahmad', age: '32 years'),
              PatientListItem(name: 'Broja Pant', age: '25 years'),
              PatientListItem(name: 'Chandra Mohan', age: '25 years'),
              PatientListItem(name: 'Deepak Rawat', age: '22 years'),
            ],
          ),
        ),
      ],
    );
  }
}

class PatientListItem extends StatelessWidget {
  final String name;
  final String age;

  const PatientListItem({
    super.key,
    required this.name,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        backgroundColor: AppConstants.primaryColor.withOpacity(0.1),
        child: const Icon(Icons.person, color: AppConstants.primaryColor),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontFamily: AppConstants.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppConstants.textPrimary,
        ),
      ),
      subtitle: Text(
        age,
        style: const TextStyle(
          fontFamily: AppConstants.fontFamily,
          fontSize: 14,
          color: AppConstants.textSecondary,
        ),
      ),
      trailing: const Icon(Icons.more_vert,
          color: AppConstants.textTertiary, size: 25),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? selectedGender;
  String? selectedAge;

  void resetFilters() {
    setState(() {
      selectedGender = null;
      selectedAge = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with centered title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 24),
                const Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppConstants.textPrimary,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 10),
            FilterSection(title: "Gender", children: [
              FilterChipWidget(
                text: "Male",
                isSelected: selectedGender == "Male",
                onTap: () {
                  setState(() {
                    selectedGender =
                        selectedGender == "Male" ? null : "Male";
                  });
                },
              ),
              FilterChipWidget(
                text: "Female",
                isSelected: selectedGender == "Female",
                onTap: () {
                  setState(() {
                    selectedGender =
                        selectedGender == "Female" ? null : "Female";
                  });
                },
              ),
            ]),
            const SizedBox(height: 20),
            FilterSection(title: "Age Range", children: [
              for (var age in [
                "0-10",
                "10-20",
                "20-30",
                "30-40",
                "40-50",
                "50-60",
                "60-70",
                "Above 70"
              ])
                FilterChipWidget(
                  text: age,
                  width: 90,
                  isSelected: selectedAge == age,
                  onTap: () {
                    setState(() {
                      selectedAge = selectedAge == age ? null : age;
                    });
                  },
                ),
            ]),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppConstants.textTertiary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: resetFilters,
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                        color: AppConstants.textTertiary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstants.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Apply",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const FilterSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppConstants.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: children,
        ),
      ],
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String text;
  final double width;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipWidget({
    super.key,
    required this.text,
    this.width = 100,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppConstants.primaryColor : Colors.grey.shade400,
            width: 2,
          ),
          color: isSelected ? AppConstants.primaryColor.withOpacity(0.1) : null,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? AppConstants.primaryColor : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
