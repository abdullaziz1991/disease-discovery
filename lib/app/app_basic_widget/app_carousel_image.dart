// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import '/app/methods/app_text_style.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart' hide CarouselController;
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '/app/app_theme/extension.dart';
// import '/app/methods/app_button.dart';
// import '../../core/strings/enum_file.dart';
// import '../../core/strings/initial_values.dart';
// import '../app_popup/app_snack_bar.dart';
// import '../api/app_upload_image/app_update_image.dart';
// import '../api/app_upload_image/image_widget.dart';

// // ignore: must_be_immutable
// class CarouselImageWidget extends StatefulWidget {
//   bool? deleteVisibility;
//   bool? updateVisibility;
//   bool? uploadVisibility;
//   List<String> allImagesPath;
//   final double? height;
//   final ValueChanged<List<String>>? newImage;
//   CarouselImageWidget(
//       {super.key,
//       this.deleteVisibility,
//       this.updateVisibility,
//       this.uploadVisibility,
//       required this.allImagesPath,
//       this.height,
//       this.newImage});

//   @override
//   State<CarouselImageWidget> createState() => _CarouselImageWidgetState();
// }

// class _CarouselImageWidgetState extends State<CarouselImageWidget> {
//   int imageSlider = 0;
//   List<Widget> images = [];
//   late List<String> allImagesPath;
//   late bool pageNumberVisibility, deleteVisibility;
//   late bool updateVisibility, uploadVisibility;
//   CarouselSliderController carouselController = CarouselSliderController();
//   @override
//   void initState() {
//     allImagesPath = widget.allImagesPath;
//     for (int i = 0; i < widget.allImagesPath.length; i++) {
//       // NetworkImageOrDefault(
//       //               imagePath: allImagesPath[i],
//       //               defaultImagePath: "profile/$defaultImage")
//       images.add(ImageWidget(newImageUrl: allImagesPath[i]));
//     }
//     deleteVisibility = widget.deleteVisibility == true ? true : false;
//     updateVisibility = widget.updateVisibility == true ? true : false;
//     uploadVisibility = widget.uploadVisibility == true ? true : false;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = ScreenUtil().screenWidth;
//     return Column(children: [
//       Stack(children: [
//         SizedBox(
//             height: widget.height ?? 3 * width / 4,
//             // width: width,
//             // decoration: BoxDecoration(
//             //     border: Border.all(color: context.colorScheme.primary),
//             //     borderRadius: BorderRadius.circular(30.r)),
//             child: Stack(alignment: Alignment.bottomCenter, children: [
//               CarouselSlider(
//                   carouselController: carouselController,
//                   items: images,
//                   options: CarouselOptions(
//                       onPageChanged: (index, reason) {
//                         setState(() {
//                           imageSlider = index;
//                         });
//                       },
//                       initialPage: imageSlider,
//                       height: widget.height ?? 3 * width / 4,
//                       // aspectRatio: 2.0,
//                       // aspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height, // ضبط النسبة بناءً على أبعاد الشاشة
//                       viewportFraction: 1.03, // لعرض صورة واحدة بشكل كامل
//                       autoPlayInterval: const Duration(seconds: 3),
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       enlargeCenterPage: false)),
//               Padding(
//                   padding: const EdgeInsets.all(30),
//                   child:
//                       Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//                     for (int i = 0; i < images.length; i++)
//                       Container(
//                           margin: const EdgeInsets.only(left: 3),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100.r),
//                               border: Border.all(
//                                   color: context.colorScheme.primary)),
//                           child: CircleAvatar(
//                               radius: imageSlider == i ? 13 : 11,
//                               backgroundColor: imageSlider == i
//                                   ? context.colorScheme.errorContainer
//                                   : context.colorScheme.onSurface,
//                               child: AppTextStyle(
//                                   text: (i + 1).toString(),
//                                   color: imageSlider == i
//                                       ? context.colorScheme.onSecondary
//                                       : context.colorScheme.surface)))
//                   ]))
//             ])),
//         Visibility(
//             visible: deleteVisibility,
//             child: InkWell(
//                 child: AppButton(
//                     title: "Delete".tr(),
//                     fontSize: 12.sp,
//                     width: 70.w,
//                     marginButton: 10,
//                     marginTop: 20.h,
//                     marginStart: 20.h,
//                     backgroundColor: context.colorScheme.primary),
//                 onTap: () {
//                   setState(() {
//                     if (allImagesPath.length > 1 && imageSlider != 0) {
//                       allImagesPath.removeWhere(
//                           (item) => item == allImagesPath[imageSlider]);
//                       images.removeWhere((item) => item == images[imageSlider]);
//                       carouselController.jumpToPage(imageSlider - 1);
//                       widget.newImage!(allImagesPath);
//                     } else if (allImagesPath.length > 1 && imageSlider == 0) {
//                       allImagesPath.removeWhere(
//                           (item) => item == allImagesPath[imageSlider]);
//                       images.removeWhere((item) => item == images[0]);
//                       carouselController.jumpToPage(0);
//                       widget.newImage!(allImagesPath);
//                       imageSlider = 0;
//                     } else if (allImagesPath.length == 1) {
//                       AppSnackBar.show(
//                           context, "You Can't Delete The Image".tr());
//                     }
//                   });
//                 })),
//       ]),
//       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//         Visibility(
//             visible: updateVisibility,
//             child: InkWell(
//                 child: AppButton(
//                     title: "Update Image".tr(),
//                     fontSize: 12.sp,
//                     width: 120.w,
//                     marginButton: 10,
//                     backgroundColor: context.colorScheme.primary),
//                 onTap: () {
//                   AppUpdateImage.show(
//                       context: context,
//                       ratioX: 4,
//                       ratioY: 3.5,
//                       imageCount: ImageCount.one,
//                       newImage: (String value) {
//                         setState(() {
//                           if (value.contains("/")) {
//                             allImagesPath[imageSlider] = value;
//                             images[imageSlider] =
//                                 ImageWidget(newImageUrl: value);
//                             widget.newImage!(allImagesPath);
//                             if (allImagesPath[0] != initImage) {
//                               deleteVisibility = true;
//                               uploadVisibility = true;
//                             }
//                           } else {
//                             AppSnackBar.show(context, value.tr());
//                           }
//                         });
//                       });
//                 })),
//         10.horizontalSpace,
//         Visibility(
//             visible: uploadVisibility,
//             child: InkWell(
//                 child: AppButton(
//                     title: "Upload New".tr(),
//                     fontSize: 12.sp,
//                     width: 120.w,
//                     marginButton: 10,
//                     backgroundColor: context.colorScheme.errorContainer),
//                 onTap: () {
//                   if (allImagesPath.length < 10) {
//                     AppUpdateImage.show(
//                         context: context,
//                         ratioX: 4,
//                         ratioY: 3.5,
//                         imageCount: ImageCount.multi,
//                         newImages: (List<String> value) {
//                           setState(() {
//                             if (value.isNotEmpty) {
//                               int imagesCount = allImagesPath.length;
//                               allImagesPath.addAll(value);
//                               for (int i = imagesCount;
//                                   i < allImagesPath.length;
//                                   i++) {
//                                 images.add(
//                                     ImageWidget(newImageUrl: allImagesPath[i]));
//                                 imageSlider = imageSlider + 1;
//                               }
//                               widget.newImage!(allImagesPath);
//                               carouselController.jumpToPage(imageSlider);
//                               imageSlider = allImagesPath.length - 1;
//                             } else {
//                               AppSnackBar.show(context,
//                                   "Image size must not exceed 10 MB".tr());
//                             }
//                           });
//                         });
//                   } else {
//                     AppSnackBar.show(context, "just 10 photos".tr());
//                   }
//                 }))
//       ])
//     ]);
//   }
// }
