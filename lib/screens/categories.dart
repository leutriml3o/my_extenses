import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Categories extends StatelessWidget{

  final List<String> categories;
  final Function deleteCategory;

  Categories(
      this.categories,
      this.deleteCategory
      );

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 450,
        child: categories.isEmpty ? Column(

          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Kategori bulunmamaktadır.',
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ):ListView.builder(
          itemBuilder: (ctx, index){
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5
              ),
              child: ListTile(
                title: Text(
                  'Başlık : ' + categories[index],
                  style: Theme.of(context).textTheme.title,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () {
                    deleteCategory(categories[index]);
                  },
                ),
              ),
            );
          },
          itemCount: categories.length,
        )
    );
  }
}