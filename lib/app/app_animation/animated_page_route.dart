import 'package:flutter/material.dart';

enum TransitionType { fade, slide }

class AnimatedPageRoute {
  static Route create({
    required Widget page,
    Duration duration = const Duration(milliseconds: 700),
    TransitionType transition = TransitionType.fade,
  }) {
    return PageRouteBuilder(
        transitionDuration: duration,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (transition) {
            case TransitionType.slide:
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child);
            case TransitionType.fade:
            default:
              return FadeTransition(opacity: animation, child: child);
          }
        });
  }
}



    // Navigator.of(context).push(
    //   AnimatedPageRoute.create(page: const SecondPage()));

// void _navigate(BuildContext context) {
//     Navigator.of(context).push(
//       AnimatedPageRoute.create(
//         page: const SecondPage(),
//         // duration: const Duration(milliseconds: 700),
//         // transition: TransitionType.fade, // أو TransitionType.slide
//       )
//     );
//   }