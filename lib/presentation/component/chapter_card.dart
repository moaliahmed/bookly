import 'package:flutter/material.dart';
import 'package:bookly/core/app_constant/app_constant.dart';


class ChapterCard extends StatelessWidget {
  final String name;
  final String tag;
  final int chapterNumber;
  final Function() press;
  const ChapterCard({
    super.key, required this.name, required this.tag, required this.chapterNumber, required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(
          horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 33,
            color: const Color(0xffd3d3d3).withOpacity(.85),
          )
        ],
      ),
      child: Row(
        children: [
          RichText(
            text:  TextSpan(
              children: [
                TextSpan(
                  text: 'Chapter $chapterNumber : $name \n',
                  style:const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppConstant.kBlackColor,
                  ),
                ),
                TextSpan(
                  text: tag,
                  style: const TextStyle(
                    color: AppConstant.kLightBlackColor,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(onPressed: press, icon:const Icon(Icons.arrow_forward_ios_rounded))
        ],
      ),
    );
  }
}
