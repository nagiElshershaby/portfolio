// import 'package:flutter/material.dart';
//
// class AnimatedColumns extends StatefulWidget {
//   final List<Widget> children;
//
//   const AnimatedColumns({super.key, required this.children});
//
//   @override
//   _AnimatedColumnsState createState() => _AnimatedColumnsState();
// }
//
// class _AnimatedColumnsState extends State<AnimatedColumns> {
//   double _offset = 0.0; // This controls how far down the columns move
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(milliseconds: 300), () {
//       setState(() {
//         _offset = 100.0; // Move the columns down by 100 pixels
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: TweenAnimationBuilder<double>(
//           tween: Tween<double>(begin: -50.0, end: _offset), // Start from -50 and move down
//           duration: Duration(seconds: 1), // Adjust duration for speed
//           curve: Curves.easeOut, // Smooth motion
//           builder: (context, value, child) {
//             return Transform.translate(
//               offset: Offset(0, value), // Move columns down
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: widget.children,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
