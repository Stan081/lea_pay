import 'package:flutter/material.dart';
import 'package:lea_pay/components/onboarding_components.dart';
import 'package:lea_pay/utils/constants.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = '${picked.day}.${picked.month}.${picked.year}';
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(kSpacingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal info',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: kSpacingSmall),
          Text(
            'Let\'s get to know each other better',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: kSpacingLarge),
          const OnboardingTextField(
            labelText: 'Full Name',
            hintText: 'Terry Melton',
          ),
          const SizedBox(height: kSpacingMedium),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: AbsorbPointer(
              child: OnboardingTextField(
                labelText: 'Date of Birth',
                hintText: '01.12.2000',
                controller: _dateController, // Use a controller
                suffixIcon: const Icon(Icons.calendar_today),
              ),
            ),
          ),
          const SizedBox(height: kSpacingMedium),
          const OnboardingTextField(
            labelText: 'Phone number',
            hintText: '+1 201 555-0123',
            keyboardType: TextInputType.phone,
            suffixIcon: Icon(Icons.check_circle, color: Colors.green),
          ),
          const SizedBox(height: kSpacingMedium),
          const OnboardingTextField(
            labelText: 'E-mail',
            hintText: 'melton_00@gmail.com',
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icon(Icons.check_circle, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
