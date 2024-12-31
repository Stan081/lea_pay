import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person_2_outlined)),
                  ),
                  const Text(
                    "Welcome Lea",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Stack(
                    children: [
                      Icon(
                        Icons.notifications_none_rounded,
                        size: 35,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: 160,
                  child: Image.asset(
                    'assets/illustrations/balance_banner.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Balance',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                      Text(
                        "\$100,000,000",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 230,
                  child: TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text('My Wallet '),
                        Icon(
                          Icons.arrow_circle_right,
                          size: 45,
                        ),
                      ],
                    ),
                  ),
                )
              ]),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
