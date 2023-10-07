
import 'package:bookly/data/datacourse/book_remote_datesourse.dart';
import 'package:bookly/data/repository/bookrepository.dart';
import 'package:bookly/domain/repository/basa_book_repository.dart';
import 'package:bookly/domain/usecase/get_all_books_usecase.dart';
import 'package:bookly/domain/usecase/get_book_details_usecase.dart';
import 'package:bookly/domain/usecase/get_book_search_usecase.dart';
import 'package:bookly/presentation/controller/book_detail_bloc.dart';
import 'package:bookly/presentation/controller/book_search_bloc.dart';
import 'package:bookly/presentation/controller/books_bloc.dart';
import 'package:get_it/get_it.dart';

final sl= GetIt.instance;
class BooksServersLocator{
  void init(){
    sl.registerFactory(() => BooksBloc(sl()));
    sl.registerFactory(() => BookDetailBloc(sl()));
    sl.registerFactory(() => BookSearchBloc(sl()));
  sl.registerLazySingleton(() => GetBookDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetAllBooksUseCase(sl()));
    sl.registerLazySingleton(() => GetBookSearchUseCase(sl()));

    sl.registerLazySingleton<BaseBookRepository>(() => BookRepository(sl()));
    sl.registerLazySingleton<BaseRemoteDateSource>(() => RemoteDateSource());

  }
}