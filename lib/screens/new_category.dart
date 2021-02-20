import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewCategory extends StatefulWidget{

  final Function addCategory;
  NewCategory(this.addCategory);

  @override
  _NewCategoryState createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory>{

  final _titleController = TextEditingController();


  void submitData(){
    if(_titleController.text.isEmpty){
      return;
    }

    final enteredTitle = _titleController.text;

    if(enteredTitle.isEmpty){
      return;
    }

    widget.addCategory(
      enteredTitle,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Kategori İsmi',
              ),
              // onChanged: (value) => this.titleInput = value,
              controller: _titleController,
              onSubmitted: (_) => submitData(),
            ),
            SizedBox(
              height: 12,
            ),

            RaisedButton(
              child: Text('Kategori Ekle'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}

