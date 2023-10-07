import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bookly/core/app_constant/reques_state.dart';
import 'package:bookly/domain/entities/book_detiales.dart';
import 'package:bookly/domain/usecase/get_book_details_usecase.dart';
import 'package:equatable/equatable.dart';

part 'book_detail_event.dart';

part 'book_detail_state.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  final GetBookDetailsUseCase getBookDetailsUseCase;

  BookDetailBloc(this.getBookDetailsUseCase) : super(const BookDetailState()) {
    on<GetBookDetailEvent>(
      (event, emit) async {
        final result = await getBookDetailsUseCase(event.bookId);
        result.fold(
          (l) => emit(
            state.copyWith(
              bookDetailsMassage: l.massage,
              bookDetailsState: RequestState.error,
            ),
          ),
          (r) => emit(
            state.copyWith(
              bookDetailModel: r,
              bookDetailsState: RequestState.loaded,
            ),
          ),
        );
      },
    );
  }
}
