import 'package:bookly/core/app_constant/reques_state.dart';
import 'package:bookly/presentation/component/rounded_button.dart';
import 'package:bookly/presentation/controller/book_detail_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/app_constant/app_constant.dart';
import 'book_rated.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailBloc, BookDetailState>(
      builder: (context, state) {
        var item = state.bookDetailModel;
        switch (state.bookDetailsState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.error:
            return const Center(child: CircularProgressIndicator());
          case RequestState.loaded:
            return Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        item!.title,
                        maxLines: 3,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width /2.9,
                          child: Column(
                            children: [
                              Text(
                                item.description,
                                maxLines: 6,
                                style:const TextStyle(
                                    fontSize: 11,
                                    color: AppConstant.kLightBlackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              RoundedButton(
                                text: 'DownLoad',
                                press:() {
                                  Uri path= Uri.parse(item.download);
                                  launchUrl(path , mode: LaunchMode.externalApplication);
                                },
                                verticalPadding: 10,
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border),
                            ),
                            const BookRated(rate: 4.3)
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 11,
                ),
                CachedNetworkImage(
                  imageUrl: item.image,
                  height: 200,
                )
              ],
            );
        }
      },
    );
  }
}

