import 'package:flutter/material.dart';
import 'screens/book_list_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book List',
      theme: AppTheme.darkTheme,
      home: const BookListScreen(),
    );
  }
}
