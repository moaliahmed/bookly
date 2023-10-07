part of 'book_search_bloc.dart';

abstract class BookSearchEvent extends Equatable {
  const BookSearchEvent();
}

class GetBookSearchEvent extends BookSearchEvent{
  final String bookSearch;

  const GetBookSearchEvent(this.bookSearch);
  @override
  List<Object?> get props => throw [bookSearch];

}