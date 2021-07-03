import 'package:flutter/material.dart';
import 'package:libre/domain/book_helper.dart';
import 'package:libre/model/book.dart';

class CreateUpdateBook extends StatefulWidget {
  static const id = '/create_update_book';

  CreateUpdateBook({
    Key? key,
  }) : super(key: key);

  @override
  _CreateUpdateBookState createState() => _CreateUpdateBookState();
}

class _CreateUpdateBookState extends State<CreateUpdateBook> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _costController = TextEditingController();
  final _urlImageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _accentColor = Theme.of(context).accentColor;

    final Book _book = ModalRoute.of(context)!.settings.arguments as Book;

    if (_book.bookId != null) {
      _titleController.text = _book.title ?? '';
      _authorController.text = _book.description ?? '';
      _descriptionController.text = _book.description ?? '';
      _costController.text = _book.cost.toString();
      _urlImageController.text = _book.urlImage ?? '';
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          _book.bookId == null ? 'Add Book' : 'Update Book',
          style: _textTheme.headline5!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  isDense: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: _accentColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: _accentColor,
                    ),
                  ),
                ),
                validator: (title) {
                  if (title == null || title.isEmpty) {
                    return 'Please enter the title of the book!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(
                  hintText: 'Author',
                  isDense: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: _accentColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: _accentColor,
                    ),
                  ),
                ),
                validator: (author) {
                  if (author == null || author.isEmpty) {
                    return 'Please enter the author of the book!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'Description',
                  isDense: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: _accentColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: _accentColor,
                    ),
                  ),
                ),
                validator: (desc) {
                  if (desc == null || desc.isEmpty) {
                    return 'Please enter the book description';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _costController,
                decoration: InputDecoration(
                  hintText: 'Cost',
                  isDense: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: _accentColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: _accentColor,
                    ),
                  ),
                ),
                validator: (cost) {
                  if (cost == null || cost.isEmpty) {
                    return 'Please enter the book cost to rent each day!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _urlImageController,
                decoration: InputDecoration(
                  hintText: 'Url Image',
                  isDense: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: _accentColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: _accentColor,
                    ),
                  ),
                ),
                validator: (url) {
                  if (url == null || url.isEmpty) {
                    return 'Please enter the  book url_image!';
                  }
                  return null;
                },
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 50),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool _isSuccess = true;

                    setState(() {
                      _isLoading = !_isLoading;
                    });

                    String? _bookId;

                    if (_book.bookId == null) {
                      _bookId = null;
                    } else {
                      _bookId = _book.bookId;
                    }

                    final _firestore = BookHelper(
                      book: Book(
                        bookId: _bookId,
                        title: _titleController.text,
                        author: _authorController.text,
                        description: _descriptionController.text,
                        cost: int.parse(_costController.text),
                        urlImage: _urlImageController.text,
                      ),
                    );

                    if (_book.bookId == null) {
                      _isSuccess = await _firestore.addBook();
                    } else {
                      _isSuccess = await _firestore.updateBook();
                    }

                    setState(() {
                      _isLoading = !_isLoading;
                    });

                    if (_isSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Process Succesfully Completed!'),
                        behavior: SnackBarBehavior.floating,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Process Failed!'),
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                    Navigator.pop(context);
                  }
                },
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        _book.bookId == null ? 'SUBMIT' : 'UPDATE',
                        style: _textTheme.button,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
