import 'package:bookly/presentation/component/two_side_button.dart';
import 'package:flutter/material.dart';

import '../../core/app_constant/app_constant.dart';
import 'book_rated.dart';
class BestOfTheDay extends StatelessWidget {
  const BestOfTheDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: 24,
                  top: 24,
                  right: MediaQuery.of(context).size.width * .35),
              height: 185,
              //   width: double.infinity*.99,
              decoration: BoxDecoration(
                color: const Color(0xffeaeaea).withOpacity(.45),
                borderRadius: BorderRadius.circular(29),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New York Time Best For 11th March 2020',
                    style: TextStyle(
                        fontSize: 9,
                        color: AppConstant.kLightBlackColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'How to win  \nFriends & Influence',
                    style:
                    Theme.of(context).textTheme.titleMedium,
                  ),
                  const Text(
                    'Gray Venchuk',
                    style: TextStyle(
                        color: AppConstant.kLightBlackColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      BookRated(rate: 4.7),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          'When the Earth was flat and everyone wanted to win the game of the best ',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            color: AppConstant.kLightBlackColor,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              'lib/assets/image/book-1.png',
              width: MediaQuery.of(context).size.width * .37,
            ),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * .3,
                child: TwoSideButton(
                  text: 'Read',
                  press: () {},
                  radious: 24,
                ),
              ))
        ],
      ),
    );
  }
}
