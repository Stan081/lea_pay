import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuickActionCards extends StatelessWidget {
  final String icon;
  final String time;

  const QuickActionCards({
    super.key,
    required this.icon,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Column(
        children: [
          SizedBox(
            width: 96,
            height: 100.6,
            child: Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SvgPicture.asset(
                  width: 34,
                  height: 34,
                  color: const Color(0xff004D43),
                  icon,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            time,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xffA4A9AE)),
          ),
        ],
      ),
    );
  }
}

// class AdditionalInfoItem extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;
//   const AdditionalInfoItem(
//       {super.key,
//       required this.icon,
//       required this.value,
//       required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: SizedBox(
//         child: Column(
//           children: [
//             Icon(
//               icon,
//               size: 32,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               label,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
