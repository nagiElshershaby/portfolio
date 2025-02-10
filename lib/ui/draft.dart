// import 'package:flutter/material.dart';
//
// class Draft extends StatelessWidget {
//   const Draft({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     const imagesUrls= [
//     'assets/images/ahadith/others1.jpg',
//     'assets/images/ahadith/others2.jpg',
//     'assets/images/ahadith/others.jpg',
//     'assets/images/ahadith/others13.jpg',
//     'assets/images/ahadith/others14.jpg',
//     'assets/images/ahadith/others9.jpg',
//     'assets/images/ahadith/others6.jpg',
//     'assets/images/ahadith/others7.jpg',
//     'assets/images/ahadith/others8.jpg',
//     'assets/images/ahadith/others10.jpg',
//     'assets/images/ahadith/others12.jpg',
//     'assets/images/ahadith/others3.jpg',
//     'assets/images/ahadith/others5.jpg',
//     'assets/images/ahadith/others11.jpg',
//     'assets/images/ahadith/others14.jpg',
//       null,
//     null,
//     null,
//     null,
//     null,
//     null,
//     ];
//     const rozemoon_imagesUrls= [
//       'assets/images/ahadith/rozemoon.jpg',
//       'assets/images/ahadith/rozemoon1.jpg',
//       'assets/images/ahadith/rozemoon2.jpg',
//       'assets/images/ahadith/rozemoon3.jpg',
//       'assets/images/ahadith/rozemoon4.jpg',
//       'assets/images/ahadith/rozemoon5.jpg',
//       'assets/images/ahadith/rozemoon6.jpg',
//       'assets/images/ahadith/rozemoon7.jpg',
//       'assets/images/ahadith/rozemoon8.jpg',
//       'assets/images/ahadith/rozemoon9.jpg',
//       'assets/images/ahadith/rozemoon10.jpg',
//       'assets/images/ahadith/rozemoon11.jpg',
//       'assets/images/ahadith/rozemoon12.jpg',
//       'assets/images/ahadith/rozemoon13.jpg',
//       'assets/images/ahadith/rozemoon14.jpg',
//       'assets/images/ahadith/rozemoon15.jpg',
//       'assets/images/ahadith/rozemoon16.jpg',
//     ];
//     return Scaffold(
//       body: scatteredImages(imagesUrls),
//     );
//   }
//   Widget screenshot({String? imagePath}) {
//     return Container(
//       width: 220,
//       height: 490,
//       decoration: BoxDecoration(
//         color: const Color(0xffFFFFFF),
//         borderRadius: const BorderRadius.all(Radius.circular(20)),
//         boxShadow: imagePath != null
//             ? const [
//           BoxShadow(
//             color: Colors.grey,
//             spreadRadius: 4,
//             blurRadius: 4,
//             offset: Offset(4, 4), // changes position of shadow
//           ),
//         ]
//             : null,
//         image: (imagePath != null)
//             ? DecorationImage(
//           image: AssetImage(
//             imagePath,
//           ),
//           filterQuality: FilterQuality.low,
//           fit: BoxFit.fill,
//         )
//             : null,
//       ),
//     );
//   }
//
//   Widget scatteredImages(List<String?> images) {
//     return Transform.rotate(
//       angle: 0.4,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           // 1st column
//           Positioned(
//             right: 800,
//             top: -360,
//             child: Column(children: [
//               screenshot(imagePath: images[0]),
//               const SizedBox(height: 20),
//               screenshot(imagePath: images[1]),
//               const SizedBox(height: 20),
//               screenshot(imagePath: images[2]),
//             ]),
//           ),
//           // 2nd column
//           Positioned(
//             right: 560,
//             top: -450,
//             child: Column(children: [
//               screenshot(imagePath: images[3]),
//               const SizedBox(height: 20),
//               screenshot(imagePath: images[4]),
//               const SizedBox(height: 20),
//               screenshot(imagePath: images[5]),
//             ]),
//           ),
//           // 3rd column
//           Positioned(
//             right: 320,
//             top: -330,
//             child: Column(children: [
//               screenshot(imagePath: images[6]),
//               const SizedBox(height: 20),
//               screenshot(imagePath: images[7]),
//               const SizedBox(height: 20),
//               screenshot(imagePath: images[8]),
//             ]),
//           ),
//           // 4th column
//           Positioned(
//             right: 80,
//             top: -400,
//             child: Column(children: [
//               screenshot(imagePath: images[9]),
//               const SizedBox(height: 20),
//               screenshot(imagePath: images[10]),
//               const SizedBox(height: 20),
//               screenshot(imagePath: images[11]),
//             ]),
//           ),
//           // 5th column
//           Positioned(
//             right: -160,
//             top: -400,
//             child: Column(children: [
//               const SizedBox(height: 400),
//               screenshot(imagePath: images[12]),
//               const SizedBox(height: 20),
//               screenshot(imagePath: images[13]),
//               const SizedBox(height: 20),
//               screenshot(imagePath: images[14]),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
