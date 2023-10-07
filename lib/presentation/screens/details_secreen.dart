import 'package:bookly/core/app_constant/app_constant.dart';
import 'package:bookly/core/app_constant/reques_state.dart';
import 'package:bookly/core/servies_locator/servies_locator.dart';
import 'package:bookly/presentation/component/book_rated.dart';
import 'package:bookly/presentation/component/rounded_button.dart';
import 'package:bookly/presentation/controller/book_detail_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';

import '../component/book_info.dart';
import '../component/chapter_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) =>
            sl<BookDetailBloc>()..add(GetBookDetailEvent(bookId)),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: size.height * .4,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/assets/image/bg.png'),
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * .1,
                            ),
                            BookInfo(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * .4 - 10),
                      child: Column(
                        children: [
                          ChapterCard(
                            chapterNumber: 1,
                            name: 'money',
                            tag: 'Life is about change',
                            press: () {},
                          ),
                          ChapterCard(
                            chapterNumber: 2,
                            name: 'power',
                            tag: 'Everything loves power',
                            press: () {},
                          ),
                          ChapterCard(
                            chapterNumber: 3,
                            name: 'influence',
                            tag: 'influence easily like never before ',
                            press: () {},
                          ),
                          ChapterCard(
                            chapterNumber: 4,
                            name: 'win',
                            tag: 'winning is what matters',
                            press: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headlineMedium,
                          children: [
                            TextSpan(text: 'You might also '),
                            TextSpan(
                                text: 'like...',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 180,
                            width: double.infinity,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 24, top: 24, right: 150),
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xfffff8f9),
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                          color: AppConstant.kBlackColor),
                                      children: [
                                        TextSpan(
                                            text:
                                                'How To Win\nFriend &Influence\n',
                                            style: TextStyle(fontSize: 20)),
                                        TextSpan(
                                          text: 'Gary Venchuk',
                                          style: TextStyle(
                                            color: AppConstant.kLightBlackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const BookRated(rate: 4.5),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      RoundedButton(
                                        text: 'Read',
                                        press: () {},
                                        verticalPadding: 10,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Image.asset(
                              'lib/assets/image/book-2.png',
                              width: 150,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ));
  }
}
