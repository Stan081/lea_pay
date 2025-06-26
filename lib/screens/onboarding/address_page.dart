import 'package:flutter/material.dart';
import 'package:lea_pay/components/onboarding_components.dart';
import 'package:lea_pay/utils/constants.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(kSpacingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your home address',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: kSpacingSmall),
          Text(
            'We need to verify your home address. This is also where we\'ll send your new card.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: kSpacingLarge),
          const OnboardingTextField(
            labelText: 'Street address (no P.O boxes)*',
            hintText: '16th Avenue, 9',
          ),
        ],
      ),
    );
  }
}
