import 'package:expenses_planner/transcations.dart';
import 'package:expenses_planner/widgets/chart.dart';
import 'package:expenses_planner/widgets/new_transcations.dart';
import 'package:expenses_planner/widgets/transcation_list.dart';

//import 'package:expenses_planner/widgets/user_transcations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenses App",
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<transcations> Transcations = [
  ];

  List<transcations> get recenttranscations {
    return Transcations.where((test) {
      return test.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }
  void deleteitem(String id){
   setState(() {
     Transcations.removeWhere((tx){
       return tx.id == id;
     });
   });
  }
  void add_trans(String txtitle, double txamount, DateTime choosedate) {
    final newtrans = transcations(
        title: txtitle,
        money: txamount,
        date: choosedate,
        id: DateTime.now().toString()
    );

    setState(() {
      Transcations.add(newtrans);
    });
  }

  void AddNewTranscations(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (bctx) {
      return GestureDetector(
        onTap: () {},
        child: NewTranscations(add_trans),
        behavior: HitTestBehavior.opaque,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Card(
              color: Theme
                  .of(context)
                  .primaryColor,
              child: Container(
                width: double.infinity,
                child: Text('List'),
                alignment: Alignment.center,
              ),
              elevation: 10,
            ),
            chart(recenttranscations),
            Transcation_list(Transcations,deleteitem),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
            Icons.add
        ),
        onPressed: () {
          AddNewTranscations(context);
        },
        backgroundColor: Colors.amber,
      ),
    );
  }
}
