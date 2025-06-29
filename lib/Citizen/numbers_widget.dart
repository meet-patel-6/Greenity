// import 'package:flutter/material.dart';
//
// class NumbersWidget extends StatefulWidget {
//   const NumbersWidget({super.key});
//
//   @override
//   State<NumbersWidget> createState() => _NumbersWidgetState();
// }
//
// class _NumbersWidgetState extends State<NumbersWidget> {
//   @override
//   Widget build(BuildContext context) => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           buildButton(context, '4', 'Trees Planted'),
//           buildDivider(),
//           buildButton(context, '35', 'People View Your Profile'),
//           buildDivider(),
//           buildButton(context, '50', 'Scan Your Tree'),
//         ],
//       );
//
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
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       );
// }
