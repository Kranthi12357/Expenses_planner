import 'package:expenses_planner/transcations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transcation_list extends StatelessWidget {
  final List<transcations> Trans;
  Function delete;

  Transcation_list(this.Trans, this.delete);

  @override
  Widget build(BuildContext context) {
    // TODO: implement bui

    return Container(
      height: 550,
      child: Trans.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "transcations empty",
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                    height: 200,
                    padding: EdgeInsets.all(10),
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 8,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '₹ ${Trans[index].money.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 3, color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            Trans[index].title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            DateFormat().format(Trans[index].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.deepOrangeAccent,
                          onPressed: () => delete(Trans[index].id),
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: Trans.length,
            ),
    );
  }
}
