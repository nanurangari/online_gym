import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class CopyRightText extends StatelessWidget {
  const CopyRightText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: size.width,
      child: Center(
        child: Text(
          '@',
          textScaleFactor: 1.0,
          style: TextStyle(
              fontSize: 10, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

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
    );
  }
}



