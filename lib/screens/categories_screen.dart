import 'package:flutter/material.dart';
import 'package:todoapp/models/category.dart';
import 'package:todoapp/services/category_service.dart';

import 'home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryName = TextEditingController();
  var _categoryDetails = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  List<Widget> _categoryList = List<Widget>();

  getAllCategories() async {
    var categories = await _categoryService.getCategories();
    categories.forEach((category) {
      _categoryList.add(
        ListTile(
          title: Text(category['name']),
        ),
      );
      print(category['name']);
    });
  }

  _showFormInDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              FlatButton(
                onPressed: () async {
                  _category.name = _categoryName.text;
                  _category.description = _categoryDetails.text;

                  var result = await _categoryService.saveCategory(_category);
                  print(result);
                },
                child: Text('Save'),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Cancel'),
              )
            ],
            title: Text('Category Form'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _categoryName,
                    decoration: InputDecoration(
                        labelText: 'Category Name',
                        hintText: 'Insert Category Name'),
                  ),
                  TextField(
                    controller: _categoryDetails,
                    decoration: InputDecoration(
                        labelText: 'Category Details',
                        hintText: 'Insert Category Details'),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        leading: RaisedButton(
          elevation: 0.0,
          color: Colors.red,
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      ),
      body: ListView(
        children: _categoryList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormInDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
