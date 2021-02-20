import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myextenses/models/transaction.dart';
import 'package:myextenses/screens/drawer.dart';
import 'package:myextenses/screens/new_transaction.dart';
import 'package:myextenses/screens/transactions.dart';
import 'package:myextenses/data/database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyExtenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(

      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  //final List<Transaction> userTransactions = [];
  
  void addNewTransaction(String title, String type, double amount, DateTime choosenDate){
    final newTransaction = Transaction(
        Id: DateTime.now().toString(), 
        Title: title, 
        Type: type, 
        Amount: amount, 
        Date: choosenDate
    );
    
    setState(() {
      Database.userTransactions.add(newTransaction);
    });
  }
  
  void callNewTransactionWidget(BuildContext ctx){
    showModalBottomSheet(
        context: ctx, 
        builder: (_){
          return NewTransaction(addNewTransaction);
        }
    );
  }
  
  void deleteTransaction(String id){
    setState(() {
      Database.userTransactions.removeWhere((t)=>t.Id==id);
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
          'HARCAMALARIM',
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
            Transactions(
              Database.userTransactions,
              deleteTransaction,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>callNewTransactionWidget(context),
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(102, 16, 105, 1),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
