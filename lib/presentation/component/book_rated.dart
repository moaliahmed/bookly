import 'package:flutter/material.dart';

import '../../core/app_constant/app_constant.dart';

class BookRated extends StatelessWidget {
  final double rate;

  const BookRated({
    super.key,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: const Color(0xfd3d3d3).withOpacity(.5),
                blurRadius: 20,
                offset: const Offset(3, 7))
          ]),
      child: Column(
        children: [
          const Icon(
            Icons.star,
            color: AppConstant.kIconColor,
            size: 15,
          ),
          Text(
            '$rate',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )
        ],
      ),
    );
  }
}
