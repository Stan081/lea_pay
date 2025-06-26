import 'package:flutter/material.dart';
import 'package:lea_pay/utils/constants.dart';

class AgreementPage extends StatelessWidget {
  const AgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(kSpacingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Agreement',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: kSpacingSmall),
          Text(
            'Please review the following documents. By pressing "I Agree", you are applying for a deposit account and charge card with Evolve Bank & Trust, Member FDIC, that funds in your deposit account may be used to pay your charge card balance if you fail to make other payment arrangements, and that you agree to the documents below. You are also authorizing us to share your personal information with Neobank.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: kSpacingLarge),
          _buildAgreementLink(context, 'Evolve Bank & Trust Electronic Communication Consent'),
          const SizedBox(height: kSpacingMedium),
          _buildAgreementLink(context, 'Evolve Bank & Trust Secured Account and Charge Card Account Disclosures and Agreement'),
          const SizedBox(height: kSpacingMedium),
          _buildAgreementLink(context, 'Evolve Bank & Trust Privacy Policy'),
          const SizedBox(height: kSpacingMedium),
          _buildAgreementLink(context, 'Neobank Rewards Program Terms and Conditions'),
          const SizedBox(height: kSpacingLarge),
          Text(
            'With your consent, we may use your personal information to offer additional services.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildAgreementLink(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
    );
  }
}
