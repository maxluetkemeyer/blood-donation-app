import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class ExpandablePanorama extends StatelessWidget {
  final ImageProvider image;
  final String title;

  const ExpandablePanorama({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 2 / 1,
          child: ClipRRect(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => _PanoramaFullscreen(title: title, image: image)));
              },
              child: Image(
                image: image,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => _PanoramaFullscreen(title: title, image: image)));
              },
              icon: Icon(
                Icons.threesixty_rounded,
                size: 50,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PanoramaFullscreen extends StatelessWidget {
  final ImageProvider image;
  final String title;

  const _PanoramaFullscreen({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Panorama(
        child: Image(
          image: image,
        ),
      ),
    );
  }
}
