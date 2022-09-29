import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double? height;
  final double? width;
  const Logo({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/logo.png'),
              ),
            ),
          ),
          Text(
            "Pua'e App",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: height! * 0.2,
              color: const Color.fromRGBO(255, 63, 18, 1),
            ), // 4, 178, 217, 1
          ),
        ],
      ),
    );
  }
}
