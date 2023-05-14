import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  const icon = Icons.logout;

  return AppBar(
    leading: const BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        icon: const Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}
