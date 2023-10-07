import 'package:bookly/core/app_constant/reques_state.dart';
import 'package:bookly/presentation/component/two_side_button.dart';
import 'package:bookly/presentation/controller/books_bloc.dart';
import 'package:bookly/presentation/screens/details_secreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_constant/app_constant.dart';
import 'book_rated.dart';

class ReadingListCard extends StatefulWidget {
  final Function() pressRead;

  const ReadingListCard({
    super.key,
    required this.pressRead,
  });

  @override
  State<ReadingListCard> createState() => _ReadingListCardState();
}

class _ReadingListCardState extends State<ReadingListCard> {
  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.favorite_border;
    return BlocBuilder<BooksBloc, BooksState>(
      builder: (context, state) {
        var item = state.booksModel;
        switch (state.bookRequestState) {
          case RequestState.loaded:
            return InkWell(
              onTap: () {},
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.8,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: item.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(left: 24, bottom: 40),
                    height: 245,
                    width: 202,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 221,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(29),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 10),
                                  blurRadius: 33,
                                  color: AppConstant.kShadowColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          child: CachedNetworkImage(
                            imageUrl: item[index].image,
                            height: 150,
                          ),
                        ),
                        Positioned(
                          top: 35,
                          right: 10,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(icon),
                              ),
                              const BookRated(rate: 4.5)
                            ],
                          ),
                        ),
                        Positioned(
                          top: 160,
                          child: SizedBox(
                            height: 85,
                            width: 202,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: RichText(
                                    maxLines: 2,
                                    text: TextSpan(
                                      style: const TextStyle(
                                          color: AppConstant.kBlackColor),
                                      children: [
                                        TextSpan(
                                          text: '${item[index].title} \n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        TextSpan(
                                          text: item[index].authors,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap:()=> Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>  DetailsScreen(bookId: item[index].id),
                                        ),
                                      ),
                                      child: Container(
                                        width: 101,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        alignment: Alignment.center,
                                        child: const Text('Details'),
                                      ),
                                    ),
                                    Expanded(
                                      child: TwoSideButton(
                                          text: 'read',
                                          press: widget.pressRead),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.error:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
