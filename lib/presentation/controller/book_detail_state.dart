part of 'book_detail_bloc.dart';

class BookDetailState extends Equatable {
  final BookDetail? bookDetailModel;
  final RequestState bookDetailsState;
  final String bookDetailsMassage;

  const BookDetailState({
    this.bookDetailModel,
    this.bookDetailsState = RequestState.loading,
    this.bookDetailsMassage = '',
  });

  BookDetailState copyWith({
    BookDetail? bookDetailModel,
    RequestState? bookDetailsState,
    String? bookDetailsMassage,

  }) {
    return BookDetailState(
      bookDetailModel: bookDetailModel ?? this.bookDetailModel,
      bookDetailsMassage: bookDetailsMassage ?? this.bookDetailsMassage,
      bookDetailsState: bookDetailsState ?? this.bookDetailsState,);
  }

  @override
  List<Object?> get props =>
      [bookDetailModel, bookDetailsState, bookDetailsMassage,];
}
