part of 'books_bloc.dart';

class BooksState extends Equatable {
  final List<Books> booksModel;
  final RequestState bookRequestState;
  final String massage;

  const BooksState({
    this.booksModel = const [],
    this.bookRequestState = RequestState.loading,
    this.massage = '',
  });

  BooksState copyWith({
    List<Books>? booksModel,
    RequestState? bookRequestState,
    String? massage,
  }) {
    return BooksState(
      bookRequestState: bookRequestState ?? this.bookRequestState,
      booksModel: booksModel ?? this.booksModel,
      massage: massage ?? this.massage,
    );
  }

  @override
  List<Object> get props => [booksModel, bookRequestState, massage];
}
