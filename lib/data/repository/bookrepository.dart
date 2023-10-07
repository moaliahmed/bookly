import 'package:bookly/core/network_error/failure.dart';
import 'package:bookly/core/network_error/server_exception.dart';
import 'package:bookly/data/datacourse/book_remote_datesourse.dart';
import 'package:bookly/domain/entities/book.dart';
import 'package:bookly/domain/entities/book_detiales.dart';
import 'package:bookly/domain/repository/basa_book_repository.dart';
import 'package:dartz/dartz.dart';

class BookRepository extends BaseBookRepository {
  final BaseRemoteDateSource baseRemoteDateSource;

  BookRepository(this.baseRemoteDateSource);

  @override
  Future< List<Books>> getAllBooks()async {
    final result = await baseRemoteDateSource.getBooks();
      return result;
  }

  @override
  Future<Either<Failure, BookDetail>> getMoreDetails(String bookId)async {
    final result= await baseRemoteDateSource.getBookDetail(bookId);
    try{
      return right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMassageModel.state));
    }
  }

  @override
  Future<Either<Failure, List<Books>>> getBookSearch(String searchTitle) async {
    final result= await baseRemoteDateSource.getBookSearch(searchTitle);
    try{
      return right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMassageModel.state));
    }
  }




}
