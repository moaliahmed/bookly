import 'package:bookly/core/servies_locator/servies_locator.dart';
import 'package:bookly/src/app_root.dart';
import 'package:flutter/cupertino.dart';

void main(){
  BooksServersLocator().init();
  runApp(const AppRoot());
}