import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTranscations extends StatefulWidget{
  final Function tran;
  NewTranscations(this.tran);

  @override
  _NewTranscationsState createState() => _NewTranscationsState();
}

class _NewTranscationsState extends State<NewTranscations> {
  final titletranscation = TextEditingController();
    DateTime selecteddate;
  final moneytranscation = TextEditingController();
  void datepicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime.now()).then((pickedDate){
      if(pickedDate == null){
        return;
      }
      setState(() {
        selecteddate = pickedDate;
      });
    });
  }
  void submitdata(){
    final enter = titletranscation.text;
    final an = double.parse(moneytranscation.text);
    if(enter.isEmpty || an <=0){
      return ;
    }
    widget.tran(titletranscation.text,double.parse(moneytranscation.text),selecteddate);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  focusColor: Colors.purpleAccent,
                ),
                style: TextStyle(fontSize: 15),
                controller: titletranscation,
                onSubmitted: (_)=>submitdata(),
              ),
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.red),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                style: TextStyle(fontSize: 16),
                controller: moneytranscation,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitdata(),
              ),

              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.green),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text(selecteddate == null?"no date choosen":DateFormat.yMMMMd().format(selecteddate),style: TextStyle(fontSize: 10,color: Colors.purpleAccent),),
                  FlatButton(
                    onPressed: datepicker,
                    textColor: Colors.purpleAccent,
                    child: Text('Choose Date',style: TextStyle(fontSize: 15),),
                  )
                ],
              ),
            ),
            FlatButton(
              child: Text('Add Transcation'),
              textColor: Colors.purpleAccent,
              onPressed: submitdata,
            ),
          ],
        ),
      ),
    );
  }
}