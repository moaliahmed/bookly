import 'package:equatable/equatable.dart';

class BookDetail extends Equatable {
  final String id;
  final String title;
  final String subTitle;
  final String description;
  final String image;
  final String download;

 const BookDetail({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.image,
    required this.download,
  });

  @override
  List<Object> get props => [
        id,
        title,
        subTitle,
        description,
        image,
        download,
      ];
}
