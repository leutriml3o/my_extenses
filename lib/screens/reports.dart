import 'package:flutter/material.dart';
import 'package:myextenses/models/report.dart';

class Reports extends StatelessWidget{
  final List<Report> reports;

  Reports(
      this.reports,
      );

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 450,
        child: reports.isEmpty ? Column(

          children: <Widget>[
            SizedBox(
              height: 20,
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
                            '\₺${reports[index].Amount.toStringAsFixed(2)}'
                        ),
                      ),
                    )
                ),

                title: Text(
                  'Toplam ' + reports[index].Type + ' Harcaması',
                  style: Theme.of(context).textTheme.title,
                ),

              ),
            );
          },
          itemCount: reports.length,
        )
    );
  }
}