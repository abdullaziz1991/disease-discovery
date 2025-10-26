// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppRating extends StatelessWidget {
  final double ratingNumber;
  final bool? ignoreGestures;
  final Color? unratedColor;
  final ValueChanged<double>? ratingValue;

  const AppRating({
    super.key,
    required this.ratingNumber,
    this.ignoreGestures,
    this.unratedColor = Colors.black54,
    this.ratingValue,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        ignoreGestures: ignoreGestures ?? true,
        itemSize: 25,
        initialRating: ratingNumber,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        updateOnDrag: true,
        unratedColor: unratedColor,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) =>
            const Icon(Icons.star, color: Colors.amber),
        onRatingUpdate: (rating) {
          ratingValue!(rating);
          print(rating);
          print(" rating --------------------------------------");
        }
        );
  }
}
