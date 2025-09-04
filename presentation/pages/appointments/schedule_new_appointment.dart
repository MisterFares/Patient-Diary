// lib/presentation/pages/appointments/schedule_new_appointment.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/core/widgets/buttons/primary_button.dart';

class ScheduleNewAppointment extends StatefulWidget {
  const ScheduleNewAppointment({super.key});

  @override
  State<ScheduleNewAppointment> createState() => _ScheduleNewAppointmentState();
}

class _ScheduleNewAppointmentState extends State<ScheduleNewAppointment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        ),
        title: const Text(
          'Schedule New Appointment',
          style: TextStyle(
            color: Colors.white,
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormFieldWithLabel(
                label: 'Enter Mobile No',
                child: _MobileNumberField(),
              ),
              const SizedBox(height: 12),
              const FormFieldWithLabel(
                label: 'Full Name',
                child: _FullNameField(),
              ),
              const SizedBox(height: 12),
              _AgeAndGenderRow(
                onGenderChanged: (value) {
                  setState(() {
                  });
                },
              ),
              const SizedBox(height: 12),
              const FormFieldWithLabel(
                label: 'Address',
                child: _AddressField(),
              ),
              const SizedBox(height: 12),
              const FormFieldWithLabel(
                label: 'Medical History',
                child: _MedicalHistoryField(),
              ),
              const SizedBox(height: 12),
              const _UploadPrescriptionButton(),
              const SizedBox(height: 110),
              PrimaryButton(
                width: double.infinity,
                text: 'Next',
                onPressed: () {
                  Navigator.pushNamed(context, AppConstants.routeSelectDateTime);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormFieldWithLabel extends StatelessWidget {
  final String label;
  final Widget child;
  
  const FormFieldWithLabel({
    super.key,
    required this.label,
    required this.child,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppConstants.textTertiary,
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}

class _MobileNumberField extends StatelessWidget {
  const _MobileNumberField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextField(
        maxLines: 1,
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppConstants.backgroundLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _FullNameField extends StatelessWidget {
  const _FullNameField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextField(
        maxLines: 1,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppConstants.backgroundLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _AgeAndGenderRow extends StatelessWidget {
  final ValueChanged<String?> onGenderChanged;
  
  const _AgeAndGenderRow({required this.onGenderChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: const FormFieldWithLabel(
            label: 'Age',
            child: _AgeField(),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FormFieldWithLabel(
            label: 'Gender',
            child: _GenderDropdown(onChanged: onGenderChanged),
          ),
        ),
      ],
    );
  }
}

class _AgeField extends StatelessWidget {
  const _AgeField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppConstants.backgroundLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}

class _GenderDropdown extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  
  const _GenderDropdown({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppConstants.backgroundLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        hint: const Text(
          'Select',
          style: TextStyle(
            color: AppConstants.textSecondary,
            fontFamily: AppConstants.fontFamily,
            fontSize: 14,
          ),
        ),
        items: const [
          DropdownMenuItem(
            value: 'male',
            child: Text(
              'Male',
              style: TextStyle(
                fontFamily: AppConstants.fontFamily,
                fontSize: 14,
              ),
            ),
          ),
          DropdownMenuItem(
            value: 'female',
            child: Text(
              'Female',
              style: TextStyle(
                fontFamily: AppConstants.fontFamily,
                fontSize: 14,
              ),
            ),
          ),
        ],
        onChanged: onChanged,
        icon: const Icon(Icons.arrow_drop_down, color: AppConstants.textSecondary),
        iconSize: 24,
        isExpanded: true,
      ),
    );
  }
}

class _AddressField extends StatelessWidget {
  const _AddressField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: 5,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 72),
        filled: true,
        fillColor: AppConstants.backgroundLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _MedicalHistoryField extends StatelessWidget {
  const _MedicalHistoryField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: 5,
      textAlignVertical: TextAlignVertical.top,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(16, 15, 16, 72),
        filled: true,
        fillColor: AppConstants.backgroundLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _UploadPrescriptionButton extends StatelessWidget {
  const _UploadPrescriptionButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppConstants.borderColor),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.file_upload_outlined,
              color: AppConstants.primaryColor,
            ),
            Text(
              'Upload Prescription',
              style: TextStyle(
                color: AppConstants.primaryColor,
                fontFamily: AppConstants.fontFamily,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}