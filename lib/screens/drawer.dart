import 'package:flutter/material.dart';
import 'package:myextenses/main.dart';
import 'package:myextenses/screens/category_main.dart';
import 'package:myextenses/screens/report_main.dart';

class MainDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top:20),
            color: Color.fromRGBO(102, 16, 105, 1),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'MENÜ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,

                      ),
                    ),
                  ),

                  ListTile(
                    title: Text(
                      'Anasayfa',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                    },
                  ),
                  ListTile(

                    title: Text(
                      'Kategoriler',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryMain()));
                    },
                  ),
                  ListTile(

                    title: Text(
                      'Rapor',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportMain()));
                    },
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}