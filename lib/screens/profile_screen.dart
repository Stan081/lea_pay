import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/components/transaction_components.dart';
import 'package:lea_pay/utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAppComponent(
      showBottomNavBar: true,
      appBar: const CustomAppBar(
        header: 'Profile',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: kSpacingHuge),
              child:
                  Stack(alignment: AlignmentDirectional.bottomEnd, children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: kSpacingSmall,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(kRadiusCircle),
                  ),
                  child: CircleAvatar(
                    backgroundImage: const AssetImage('assets/images/Lea.PNG'),
                    backgroundColor: Colors.grey[350],
                    radius: kSpacingHuge * 2, // Keep custom size
                  ),
                ),
                Container(
                  width: kSpacingXXLarge, // Keep custom size
                  height: kSpacingXXLarge, // Keep custom size
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(kRadiusXLarge),
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: kIconSizeMedium,
                  ),
                )
              ]),
            ),
            const _InfoSection(
              title: 'Personal Info',
              editable: true,
              infos: [
                _InfoItem(
                  icon: Icons.person_2_outlined,
                  title: 'Name',
                  value: 'Jasmine Suleiman',
                ),
                _InfoItem(
                  icon: Icons.email_outlined,
                  title: 'Email',
                  value: 'jassulei@gmail.com',
                ),
                _InfoItem(
                  icon: Icons.local_phone_outlined,
                  title: 'Phone',
                  value: '+234 7098 6899 765',
                ),
                _InfoItem(
                  icon: Icons.location_on_outlined,
                  title: 'Address',
                  value: '5 Walker Court, Arbury',
                ),
              ],
            ),
            const _InfoSection(
              title: 'Account Info',
              infos: [
                _InfoItem(
                  icon: Icons.credit_card_outlined,
                  title: 'Card',
                  value: '**** **** **** 1234',
                ),
                _InfoItem(
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'Wallet ID',
                  value: '123456789',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final bool editable;
  final List<_InfoItem> infos;

  const _InfoSection({
    required this.title,
    this.editable = false,
    required this.infos,
  });

  @override
  Widget build(BuildContext context) {
    return TransactionCard(
      heading: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Headings(text: title),
          if (editable)
            Text(
              'Edit',
              style: TextStyle(
                  fontSize: kFontSizeLarge,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
        ],
      ),
      content: Column(
        children: infos,
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpacingSmall),
      child: Row(
        children: [
          Icon(
            icon,
            size: kIconSizeLarge,
          ),
          const SizedBox(width: kSpacingMedium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarSubHeaderText(text: title),
              BodyText(
                text: value,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ],
      ),
    );
  }
}
