import 'package:expenses_planner/transcations.dart';
import 'package:expenses_planner/widgets/chart_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class chart extends StatelessWidget {
  final List<transcations> recentranscations;

  chart(this.recentranscations);

  List<Map<String, Object>> get transcationsvalues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalsum = 0;
      for (var i = 0; i < recentranscations.length; i++) {
        if (recentranscations[i].date.day == weekday.day
            && recentranscations[i].date.month == weekday.month
            && recentranscations[i].date.year == weekday.year) {
          totalsum += recentranscations[i].money;
        }
      }
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalsum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return transcationsvalues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: transcationsvalues.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(data['day'], data['amount'],
              maxSpending == 0.0? 0.0 :  (data['amount'] as double) / maxSpending),
          );
        }).toList(),
      ),
    );
  }

}