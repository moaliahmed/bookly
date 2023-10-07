import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookly/core/app_constant/reques_state.dart';
import 'package:bookly/domain/entities/book.dart';
import 'package:bookly/domain/usecase/get_all_books_usecase.dart';
import 'package:equatable/equatable.dart';

part 'books_event.dart';

part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {

  final GetAllBooksUseCase getAllBooksUseCase;
  BooksBloc(this.getAllBooksUseCase,) : super(const BooksState()) {
    on<GetBooksEvent>(
      (event, emit) async {
        final result = await getAllBooksUseCase();
        return emit(state.copyWith(
            booksModel: result, bookRequestState: RequestState.loaded));
      },
    );

  }
}
