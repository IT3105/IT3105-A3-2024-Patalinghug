import 'package:flutter/material.dart';
import '../models/book.dart';
import '../theme/app_theme.dart';

class BookTable extends StatelessWidget {
  final List<Book> books;
  final Function(Book, int) onEdit;
  final Function(int) onDelete;
  final Function(int) onStatusUpdate;

  const BookTable({
    super.key,
    required this.books,
    required this.onEdit,
    required this.onDelete,
    required this.onStatusUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Book Name')),
          DataColumn(label: Text('Author')),
          DataColumn(label: Text('Genre')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Functions')),
        ],
        rows: books.asMap().entries.map((entry) {
          final index = entry.key;
          final book = entry.value;
          return DataRow(cells: [
            DataCell(Text(book.name)),
            DataCell(Text(book.author)),
            DataCell(Text(book.genre)),
            DataCell(Text(book.status)),
            DataCell(Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  color: AppTheme.buttonColors['edit'],
                  onPressed: () => onEdit(book, index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  color: AppTheme.buttonColors['delete'],
                  onPressed: () => onDelete(index),
                ),
                IconButton(
                  icon: const Icon(Icons.update),
                  color: AppTheme.buttonColors['status'],
                  onPressed: () => onStatusUpdate(index),
                ),
              ],
            )),
          ]);
        }).toList(),
      ),
    );
  }
}