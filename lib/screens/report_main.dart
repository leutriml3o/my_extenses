import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:myextenses/data/database.dart';
import 'package:myextenses/models/report.dart';
import 'package:myextenses/models/transaction.dart';
import 'package:myextenses/screens/reports.dart';
import 'drawer.dart';

class ReportMain extends StatefulWidget{
  @override
  _ReportMainState createState() => _ReportMainState();
}

class _ReportMainState extends State<ReportMain>{
  DateTime selectedStartDate;
  DateTime selectedEndDate;
  List<Report> reports = [];

  void presentStartDatePicker() {
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
        selectedStartDate = pickedDate;
      });
    });
  }

  void presentEndDatePicker() {
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
        selectedEndDate = pickedDate;
      });
    });
  }

  void getReport(){
    if(reports.isNotEmpty){
      reports.clear();
    }
    var list = Database.userTransactions.where((element) =>
        element.Date.isAfter(selectedStartDate) &&
        element.Date.isBefore(selectedEndDate)).toList();

    setState(() {
      for(final category in Database.categories){
        double amount=0;
        list.where((element) =>
        element.Type==category)
            .forEach((element) {amount+=element.Amount;});
        reports.add(Report(
            Amount: amount,
            Type: category
        ));
      }
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
          'RAPOR',
          style: TextStyle(color: Color.fromRGBO(230, 237, 237, 1)),
        ),

        backgroundColor: Color.fromRGBO(102, 16, 105, 1),
        centerTitle: true,
      ),

      drawer: MainDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[

            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      selectedStartDate == null
                          ? 'Tarih Seçiniz: '
                          : 'Seçilen Tarih: ${DateFormat.yMd().format(selectedStartDate)}',
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
                    onPressed: presentStartDatePicker,
                  )
                ],
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      selectedEndDate == null
                          ? 'Tarih Seçiniz: '
                          : 'Seçilen Tarih: ${DateFormat.yMd().format(selectedEndDate)}',
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
                    onPressed: presentEndDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Listele'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: getReport,
            ),

            Reports(reports)
          ],
        ),
      ),

    );
  }
}