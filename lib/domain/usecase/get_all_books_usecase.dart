import 'package:bookly/domain/entities/book.dart';
import 'package:bookly/domain/repository/basa_book_repository.dart';

class GetAllBooksUseCase{
  final BaseBookRepository baseBookRepository;

  GetAllBooksUseCase(this.baseBookRepository);

  Future<List<Books>> call() async{
    return await baseBookRepository.getAllBooks();
  }

}