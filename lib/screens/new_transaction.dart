import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myextenses/data/database.dart';

class NewTransaction extends StatefulWidget{

  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction>{

  final _titleController = TextEditingController();
  String choosenType;
  final _amountController = TextEditingController();
  DateTime selectedDate;

  void submitData(){
    if(_amountController.text.isEmpty){
      return;
    }

    final enteredTitle = _titleController.text;

    final enteredAmount = double.parse(_amountController.text);

    if(enteredTitle.isEmpty || choosenType==null || enteredAmount<=0 || selectedDate == null){
      return;
    }

    widget.addTransaction(
      enteredTitle,
      choosenType,
      enteredAmount,
      selectedDate,
    );

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        selectedDate = pickedDate;
      });
    });
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
                labelText: 'Başlık',
              ),
              // onChanged: (value) => this.titleInput = value,
              controller: _titleController,
              onSubmitted: (_) => submitData(),
            ),
            SizedBox(
              height: 12,
            ),
            DropdownButton(
              hint: Text('Kategori'),
              isExpanded: true,
              dropdownColor: Color.fromRGBO(200, 200, 200, 1),
              icon: Icon(Icons.arrow_drop_down),
              value: choosenType,
              onChanged: (newValue){
                setState(() {
                  choosenType=newValue;
                });
              },

              items: Database.categories.map((item){
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Tutar',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {
              //   this.amountInput = value;
              // },
              controller: _amountController,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? 'Tarih Seçiniz: '
                          : 'Seçilen Tarih: ${DateFormat.yMd().format(selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Tarih Seç',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Harcama Ekle'),
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

