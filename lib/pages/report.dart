
import 'package:flutter/material.dart';
import 'package:expense_tracker/styles/text_styles.dart';
import 'package:expense_tracker/widget/generic.dart';
import 'package:expense_tracker/view.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 32.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: new Container(
                margin: const EdgeInsets.only(top: 12.0),
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: new Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            new SizedBox(height: 24.0),
            new Text("Your Report", style: TextStyles.humongous),
            new SizedBox(height: 12.0),

            new ReportSummaryWidget(),
            new SizedBox(height: 16.0),
            Flexible(
              child: new ListView.builder(
                itemBuilder: (BuildContext __, int index){
                  if(index % 3 ==0) {
                    return Container(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: BudgetWidget(budgetType: BudgetType.OUTFLOW, source: "Outflow Source Name", amount: (index + 1) * 100));
                  }

                  return Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                      child: BudgetWidget(budgetType: BudgetType.INFLOW, source: "Inflow Source Name", amount: (index + 1) * 1000));
                },
                itemCount: 24,
              ),
            )
          ]),
    ));
  }
}
