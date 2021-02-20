import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myextenses/data/database.dart';
import 'package:myextenses/screens/categories.dart';
import 'package:myextenses/screens/new_category.dart';
import 'drawer.dart';


class CategoryMain extends StatefulWidget{
  @override
  _CategoryMainState createState() => _CategoryMainState();
}


class _CategoryMainState extends State<CategoryMain> {

  //final List<Transaction> userTransactions = [];

  void addNewCategory(String title){
    final newCategory = title;

    setState(() {
      Database.categories.add(newCategory);
    });
  }

  void callNewCategoryWidget(BuildContext ctx){
    showModalBottomSheet(
        context: ctx,
        builder: (_){
          return NewCategory(addNewCategory);
        }
    );
  }

  void deleteCategory(String title){
    setState(() {
      Database.categories.removeWhere((t)=>t==title);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          'KATEGORİLERİM',
          style: TextStyle(color: Color.fromRGBO(230, 237, 237, 1)),
        ),

        backgroundColor: Color.fromRGBO(102, 16, 105, 1),
        centerTitle: true,
      ),

      drawer: MainDrawer(),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Categories(
              Database.categories,
              deleteCategory,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>callNewCategoryWidget(context),
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(102, 16, 105, 1),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
