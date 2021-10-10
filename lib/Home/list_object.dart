import 'package:flutter/material.dart';

class ListObject extends StatelessWidget {
  final String title;
  final Widget onTap;

  const ListObject({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => onTap),
            );
          },
        ),
        Divider(),
      ],
    );
  }
}
