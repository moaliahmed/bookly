import 'package:bookly/core/network_error/error_massage_model.dart';
import 'package:bookly/core/network_error/server_exception.dart';
import 'package:bookly/data/model/book_detail_model.dart';
import 'package:bookly/data/model/book_model.dart';
import 'package:bookly/domain/entities/book.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteDateSource {
  Future<List<BooksModel>> getBooks();

  Future<BookDetailModel> getBookDetail(String bookId);

  Future<List<BooksModel>> getBookSearch(String searchTitle);
}

class RemoteDateSource extends BaseRemoteDateSource {
  @override
  Future<List<BooksModel>> getBooks() async {
    final response = await Dio().get('https://www.dbooks.org/api/recent');
    return List<BooksModel>.from(
        (response.data['books'] as List).map((e) => BooksModel.fromJson(e)));
  }

  @override
  Future<BookDetailModel> getBookDetail(String bookId) async {
    final response = await Dio().get('https://www.dbooks.org/api/book/$bookId');
    if (response.statusCode == 200) {
      return BookDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<BooksModel>> getBookSearch(String searchTitle) async {
    final response = await Dio().get('https://www.dbooks.org/api/search/$searchTitle');
    if (response.statusCode == 200) {
      return List<BooksModel>.from(
          (response.data['books'] as List).map((e) => BooksModel.fromJson(e)));
    }
    else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }
}
