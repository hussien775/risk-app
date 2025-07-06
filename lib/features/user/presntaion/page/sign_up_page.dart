import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk/features/user/presntaion/widget/image_of_waves_widget.dart';
import 'package:risk/features/user/presntaion/widget/sign_up_widget.dart';
import '../widget/container_of_grediant_color_widget.dart';
import '../widget/logo_of_sign_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key,required this.idUser});
  final String idUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffF6F7F9),
      body: ContainerOfGrediantColorWidget(
        child:  SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(
              children: [
               const ImageOfWaveWidget(),

                const LogoOfSignWidget(),
                15.verticalSpace,
                SignUpWidget(idUser: idUser,)
              ],
            ),
          ),
        ),

    );
  }
}

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = new Path();
//     path.lineTo(0, size.height - 25);
//     var firstStar = Offset(size.width / 15, size.height - 20);
//     var firstEnd = Offset(size.width / 9, size.height);
//     path.quadraticBezierTo(
//         firstStar.dx, firstStar.dy, firstEnd.dx, firstEnd.dy);
//
//     var secondStar = Offset(size.width / 6, size.height - 50);
//     print(secondStar);
//     var secondEnd = Offset(size.width / 5, size.height - 20);
//     path.quadraticBezierTo(
//         secondStar.dx, secondStar.dy, secondEnd.dx, secondEnd.dy);
//
//     var thirdStar = Offset(size.width / 6, size.height);
//     print(secondStar);
//     var thirdEnd = Offset(size.width / 5, size.height / size.height);
//     path.quadraticBezierTo(
//         thirdStar.dx, thirdStar.dy, thirdEnd.dx, thirdEnd.dy);
//     // var firstStar = Offset(size.width/10, size.height);
//     // var firstEnd = Offset(size.width/5 , size.height/2);
//     // path.quadraticBezierTo(firstStar.dx, firstStar.dy, firstEnd.dx, firstEnd.dy);
//     // var secondStar = Offset(size.width/10, size.height/2);
//     // var secondtEnd = Offset(size.width , size.height );
//     // path.quadraticBezierTo(secondStar.dx, secondStar.dy, secondtEnd.dx, secondtEnd.dy);
//     //  var thirdStar = Offset(size.width/10, size.height/2);
//     //  var thirdEnd = Offset(size.width , size.height );
//     //  path.quadraticBezierTo(thirdStar.dx, thirdStar.dy, thirdEnd.dx, thirdEnd.dy);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
