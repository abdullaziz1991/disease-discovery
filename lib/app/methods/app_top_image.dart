import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../api/local_images_path.dart';

// class AppTopImage extends StatelessWidget {
//   final double? opacity;
//   const AppTopImage({super.key, this.opacity});

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//         opacity: opacity ?? 1,
//         child: Container(
//             // alignment: AlignmentDirectional.topStart,
//             child: Image.asset(
//           ImagesPath.auth.imageTop,
//           width: double.infinity,
//         )));
//   }
// }
class AppTopImage extends StatelessWidget {
  final double? opacity;
  const AppTopImage({super.key, this.opacity});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity ?? 1,
      child: Transform(
        alignment: Alignment.center,
        transform: EasyLocalization.of(context)!.locale.languageCode == 'ar'
            ? Matrix4.rotationY(3.1416) // انعكاس أفقي
            : Matrix4.identity(), // بدون تغيير
        child: Image.asset(
          ImagesPath.auth.imageTop,
          width: double.infinity,
        ),
      ),
    );
  }
}
