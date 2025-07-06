import 'package:flutter/material.dart';

class ImageOfWaveWidget extends StatelessWidget {
  const ImageOfWaveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(
          height: 130,
          width: double.infinity,
          fit: BoxFit.contain,
          color: Colors.white,
          "assest/images/Vector 7 (1).png",
        ),
        Image.asset(
          height: 128,
          width: double.infinity,
          fit: BoxFit.contain,
          color: Colors.white,
          "assest/images/Vector 7 (1).png",
        ),
        Image.asset(
          height: 126,
          width: double.infinity,
          fit: BoxFit.contain,
          color: Colors.white,
          "assest/images/Vector 7 (1).png",
        ),
        Image.asset(
          height: 126,
          width: double.infinity,
          fit: BoxFit.contain,
          color: Colors.white,
          "assest/images/Vector 7 (1).png",
        ),
        Image.asset(
          height: 126,
          width: double.infinity,
          fit: BoxFit.contain,
          color: Colors.white,
          "assest/images/Vector 7 (1).png",
        ),

      ],
    );
  }
}
