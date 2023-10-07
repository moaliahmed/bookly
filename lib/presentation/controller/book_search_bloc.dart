import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookly/core/app_constant/reques_state.dart';
import 'package:bookly/domain/entities/book.dart';
import 'package:equatable/equatable.dart';
import 'package:bookly/domain/usecase/get_book_search_usecase.dart';

part 'book_search_event.dart';

part 'book_search_state.dart';

class BookSearchBloc extends Bloc<BookSearchEvent, BookSearchState> {
  final GetBookSearchUseCase getBookSearchUseCase;

  BookSearchBloc(this.getBookSearchUseCase) : super(const BookSearchState()) {
    on<GetBookSearchEvent>(
      (event, emit) async {
        final result = await getBookSearchUseCase(event.bookSearch);
        result.fold(
            (l) => emit(state.copyWith(
                massage: l.massage , bookRequestState: RequestState.error)),
            (r) => emit(state.copyWith(
                booksModel: r, bookRequestState: RequestState.loaded)));
      },
    );
  }
}
