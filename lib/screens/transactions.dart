import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Transactions extends StatelessWidget{

  final List<Transaction> transactions;
  final Function deleteTransaction;

  Transactions(
      this.transactions,
      this.deleteTransaction
      );

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 450,
      child: transactions.isEmpty ? Column(

        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            'Henüz bir harcama bulunmamaktadır.',
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
                leading: CircleAvatar(
                  radius: 30,
                  child:Padding(
                    padding: EdgeInsets.all(8),
                    child: FittedBox(
                      child: Text(
                        '\₺${transactions[index].Amount.toStringAsFixed(2)}'
                      ),
                    ),
                  )
                ),

                title: Text(
                  'Başlık : ' + transactions[index].Title + '\nİşlem Türü : ' + transactions[index].Type,
                  style: Theme.of(context).textTheme.title,
                ),

                subtitle: Text(
                  DateFormat.yMMMd().format(transactions[index].Date),
                ),

                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () {
                    deleteTransaction(transactions[index].Id);
                  },
                ),
              ),
            );
          },
        itemCount: transactions.length,
      )
    );
  }
}