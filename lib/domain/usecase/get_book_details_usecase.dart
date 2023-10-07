import 'package:bookly/core/network_error/failure.dart';
import 'package:bookly/domain/entities/book_detiales.dart';
import 'package:bookly/domain/repository/basa_book_repository.dart';
import 'package:dartz/dartz.dart';

class GetBookDetailsUseCase{
  final BaseBookRepository baseBookRepository;

   GetBookDetailsUseCase(this.baseBookRepository);

  Future<Either<Failure,BookDetail>> call(String bookId)async{
    return await baseBookRepository.getMoreDetails(bookId);
  }
}