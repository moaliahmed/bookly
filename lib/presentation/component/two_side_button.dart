import 'package:flutter/material.dart';

import '../../core/app_constant/app_constant.dart';
class TwoSideButton extends StatelessWidget {
  final String text;
  final Function() press;
  final double radious;

  const TwoSideButton({
    super.key,
    required this.text,
    required this.press,
    this.radious=29,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding:const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppConstant.kBlackColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radious), bottomRight: Radius.circular(radious)),
        ),
        child: Text(text, style:const TextStyle(color: Colors.white)),
      ),
    );
  }
}
