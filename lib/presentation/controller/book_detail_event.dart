part of 'book_detail_bloc.dart';

abstract class BookDetailEvent extends Equatable {
  const BookDetailEvent();
}

class GetBookDetailEvent extends BookDetailEvent {
  final String bookId;

  const GetBookDetailEvent(this.bookId);
  @override
  List<Object> get props => [bookId];

}