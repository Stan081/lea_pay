import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/components/transactions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAppComponent(
      showBottomNavBar: true,
      appBar: const StaticAppBar(
        header: Headings(text: 'Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child:
                  Stack(alignment: AlignmentDirectional.bottomEnd, children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 6,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(110),
                  ),
                  child: CircleAvatar(
                    backgroundImage:
                        const AssetImage('./assets/images/Lea.PNG'),
                    backgroundColor: Colors.grey[350],
                    radius: 90,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 35,
                  ),
                )
              ]),
            ),
            const TransactionCard(
              content: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_2_outlined,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBarSubHeaderText(text: 'Name'),
                            BodyText(
                              text: 'Jasmine Suleiman',
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBarSubHeaderText(text: 'Email'),
                            BodyText(
                              text: 'jassulei@gmail.com',
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.local_phone_outlined,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBarSubHeaderText(text: 'Phone'),
                            BodyText(
                              text: '+234 7098 6899 765',
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person_2_outlined,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBarSubHeaderText(text: 'Adderess'),
                            BodyText(
                              text: '5 Walker Court, Arbury',
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              heading: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Headings(text: 'Personal Info'),
                  Text(
                    'Edit',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const TransactionCard(
              content: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_2_outlined,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBarSubHeaderText(text: 'Name'),
                            BodyText(
                              text: 'Jasmine Suleiman',
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBarSubHeaderText(text: 'Email'),
                            BodyText(
                              text: 'jassulei@gmail.com',
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.local_phone_outlined,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBarSubHeaderText(text: 'Phone'),
                            BodyText(
                              text: '+234 7098 6899 765',
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person_2_outlined,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBarSubHeaderText(text: 'Adderess'),
                            BodyText(
                              text: '5 Walker Court, Arbury',
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              heading: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Headings(text: 'Account Info'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
