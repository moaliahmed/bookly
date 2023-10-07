import 'package:bookly/domain/entities/book_detiales.dart';
import 'package:equatable/equatable.dart';

class BookDetailModel extends BookDetail {
  const BookDetailModel({
    required super.id,
    required super.title,
    required super.subTitle,
    required super.description,
    required super.image,
    required super.download,
  });

  factory BookDetailModel.fromJson(Map<String, dynamic> json) =>
      BookDetailModel(
        id: json['id'],
        title: json['title'],
        subTitle: json['subtitle'],
        description: json['description'],
        image: json['image'],
        download: json['download'],
      );
}
