// import 'package:flutter/material.dart';
//
// class NumbersWidget extends StatelessWidget {
//   const NumbersWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           buildButton(context, '241', 'Accepted'),
//           buildDivider(),
//           buildButton(context, '193', 'Help to Plant Tree'),
//           buildDivider(),
//           buildButton(context, '19', 'Deleted'),
//         ],
//       );
//   Widget buildDivider() => const SizedBox(
//         height: 24,
//         child: VerticalDivider(),
//       );
//
//   Widget buildButton(BuildContext context, String value, String text) =>
//       MaterialButton(
//         padding: const EdgeInsets.symmetric(vertical: 4),
//         onPressed: () {},
//         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               value,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             ),
//             const SizedBox(height: 2),
//             Text(
//               text,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       );
// }
