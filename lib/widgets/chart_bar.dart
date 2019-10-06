import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ChartBar extends StatelessWidget{
  final String label;
  final double SpendingAmount;
  final double SpendingTotal;
  ChartBar(this.label,this.SpendingAmount,this.SpendingTotal);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        FittedBox(child: Text('₹ ${SpendingAmount.toStringAsFixed(0)}')),
        SizedBox(height: 4,),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(border: Border.all(width: 1.0,color: Colors.grey),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: SpendingTotal ,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label,)
      ],
    );
  }

}