import 'package:bookly/core/network_error/failure.dart';
import 'package:bookly/domain/entities/book.dart';
import 'package:bookly/domain/repository/basa_book_repository.dart';
import 'package:dartz/dartz.dart';

class GetBookSearchUseCase {
  final BaseBookRepository baseBookRepository;

  GetBookSearchUseCase(this.baseBookRepository);

  Future <Either<Failure,List<Books>>> call(String searchTitle)async{
    return await baseBookRepository.getBookSearch(searchTitle);
  }
}