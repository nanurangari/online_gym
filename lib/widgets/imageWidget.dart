import 'package:flutter/material.dart';

class ImageWithAsset extends StatelessWidget {
  final String path;
  final double? height, width;
  final BoxFit? boxFit;

  const ImageWithAsset({
    Key? key,
    required this.path,
    this.height,
    this.width,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Image(
      image: AssetImage('assets/' + path),
      height: height ?? size.height * .25,
      width: width ?? size.width * .25,
      fit: boxFit ?? BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => Text(
        "Image is not load",
        style: TextStyle(color: Colors.red, fontSize: 10),
        textScaleFactor: 1,
      ),
    );
  }
}

class ImageWithNetwork extends StatelessWidget {
  final String url;
  final double? height, width;
  final BoxFit? boxFit;

  const ImageWithNetwork(
      {Key? key, required this.url, this.height, this.width, this.boxFit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Image(
      image: NetworkImage(url),
      height: height ?? size.height * .25,
      width: width ?? size.width * .25,
      fit: boxFit ?? BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => Text(
        "Image is not load",
        style: TextStyle(color: Colors.red, fontSize: 10),
        textScaleFactor: 1,
      ),
    );
  }
}
