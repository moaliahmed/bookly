import 'package:bookly/core/network_error/failure.dart';
import 'package:bookly/domain/entities/book.dart';
import 'package:bookly/domain/entities/book_detiales.dart';
import 'package:dartz/dartz.dart';

abstract class BaseBookRepository {
Future<List<Books>> getAllBooks();
Future<Either<Failure,BookDetail>> getMoreDetails(String bookId);
Future <Either<Failure,List<Books>>> getBookSearch(String searchTitle);
}