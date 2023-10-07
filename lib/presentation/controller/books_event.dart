part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();
}

class GetBooksEvent extends BooksEvent{

  @override
  List<Object?> get props => throw UnimplementedError();

}