import 'package:equatable/equatable.dart';

class Books extends Equatable {
  final String id;
  final String title;
  final String subTitle;
  final String authors;
  final String image;
  final String url;

 const Books(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.authors,
      required this.image,
      required this.url});

  @override
  List<Object> get props => [
        id,
        title,
        subTitle,
        authors,
        image,
        url,
      ];
}
