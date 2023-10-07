part of 'book_search_bloc.dart';


class BookSearchState extends Equatable {
  final List<Books> booksModel;
  final RequestState bookRequestState;
  final String massage;

  const BookSearchState({
    this.booksModel = const [],
    this.bookRequestState = RequestState.loading,
    this.massage = '',
  });

  BookSearchState copyWith({
    List<Books>? booksModel,
    RequestState? bookRequestState,
    String? massage,
  }) {
    return BookSearchState(
      bookRequestState: bookRequestState ?? this.bookRequestState,
      booksModel: booksModel ?? this.booksModel,
      massage: massage ?? this.massage,
    );
  }

  @override
  List<Object> get props => [booksModel, bookRequestState, massage];
}

