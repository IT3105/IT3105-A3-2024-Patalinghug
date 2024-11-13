import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_form.dart';
import '../widgets/book_table.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  final List<Book> books = [];
  bool showForm = false;
  Book? selectedBook;
  int? selectedIndex;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _authorController = TextEditingController();
  final _genreController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _authorController.dispose();
    _genreController.dispose();
    super.dispose();
  }

 void _showForm([Book? book, int? index]) {
  if (book != null) {
    _nameController.text = book.name;
    _authorController.text = book.author;
    _genreController.text = book.genre;
    selectedBook = book;
    selectedIndex = index;
  } else {
    _clearForm();
  }
  setState(() => showForm = true);
}

  void _clearForm() {
    _nameController.clear();
    _authorController.clear();
    _genreController.clear();
    selectedBook = null;
    selectedIndex = null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        if (selectedBook != null && selectedIndex != null) {
          books[selectedIndex!] = Book(
            name: _nameController.text,
            author: _authorController.text,
            genre: _genreController.text,
            status: selectedBook!.status,
          );
        } else {
          books.add(Book(
            name: _nameController.text,
            author: _authorController.text,
            genre: _genreController.text,
          ));
        }
        showForm = false;
        _clearForm();
      });
    }
  }

  void _deleteBook(int index) {
    setState(() => books.removeAt(index));
  }

  void _showStatusOptions(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _statusButton('To Read', index),
            _statusButton('Reading', index),
            _statusButton('Done', index),
          ],
        ),
      ),
    );
  }

  Widget _statusButton(String status, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7A4190),
          minimumSize: const Size(double.infinity, 40),
        ),
        onPressed: () {
          setState(() => books[index].status = status.toLowerCase());
          Navigator.pop(context);
        },
        child: Text(status),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book List',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: BookTable(
                    books: books,
                    onEdit: _showForm,
                    onDelete: _deleteBook,
                    onStatusUpdate: _showStatusOptions,
                  ),
                ),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                 backgroundColor: Theme.of(context).primaryColor, ),
                  onPressed: () => _showForm(),
                  child: const Text('Add a book',  style: TextStyle(color: Colors.white), 
                               ),
                              ),
              ],
            ),
          ),
          if (showForm)
            BookForm(
              nameController: _nameController,
              authorController: _authorController,
              genreController: _genreController,
              formKey: _formKey,
              onSubmit: _submitForm,
              onCancel: () {
                setState(() {
                  showForm = false;
                  _clearForm();
                });
              },
            ),
        ],
      ),
    );
  }
}