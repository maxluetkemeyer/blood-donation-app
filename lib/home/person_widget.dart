import 'package:flutter/material.dart';

class PersonWiget extends StatelessWidget {
  final ImageProvider image;
  final String text;

  const PersonWiget({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ClipRRect(
            child: Image(
              image: image,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width - 30,
            child: RichText(
              text: TextSpan(
                text: '„',
                style: TextStyle(
                  fontSize: 26,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                ),
                children: [
                  TextSpan(
                    text: text,
                    style: TextStyle(
                      fontSize: 26,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const TextSpan(text: '”'),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
