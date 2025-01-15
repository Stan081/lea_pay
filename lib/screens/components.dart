import 'package:flutter/material.dart';
import 'package:lea_pay/components/general_components.dart';

class Components extends StatefulWidget {
  const Components({super.key});

  @override
  State<Components> createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseAppComponent(
          body: Column(
        children: [Container()],
      )),
    );
  }
}
