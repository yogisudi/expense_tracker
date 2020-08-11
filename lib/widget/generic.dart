
import 'package:flutter/material.dart';
import 'package:expense_tracker/styles/color_styles.dart';
import 'package:expense_tracker/styles/text_styles.dart';
import 'package:expense_tracker/view.dart';

class IntroWidget extends StatelessWidget {
  final String imageAssetPath;
  final String title;
  final String content;

  IntroWidget(
      {@required this.imageAssetPath,
      @required this.title,
      @required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: new Container(
                decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageAssetPath),
                        fit: BoxFit.contain)),
              ),
            ),
          ),
          new Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 44.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(title, style: TextStyles.humongous),
                  new SizedBox(height: 24.0),
                  new Text(
                    content,
                    style: TextStyles.smallMedium
                        .copyWith(color: ColorStyles.secondaryTextColor),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReportSummaryWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: ColorStyles.lightGreen.withOpacity(0.2),
            ),
            padding: const EdgeInsets.all(20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                reportContent("INFLOW", "+3500"),
                reportContent("OUTFLOW", "-2000"),
                reportContent("BALANCE", "+1500"),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget reportContent(String name, String amount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            name,
            style:
                TextStyles.smallMedium.copyWith(color: ColorStyles.lightGreen),
          ),
          new SizedBox(height: 4.0),
          new Text(
            amount,
            style: TextStyles.bodyBold,
          )
        ],
      ),
    );
  }
}

class BudgetWidget extends StatelessWidget {
  final BudgetType budgetType;
  final String source;
  final int amount;

  BudgetWidget(
      {@required this.budgetType,
      @required this.source,
      @required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: ColorStyles.background,
      ),
      child: new ListTile(
        leading: new Container(
            height: 44.0,
            width: 44.0,
            decoration: new BoxDecoration(
              color: ((budgetType == BudgetType.INFLOW)
                      ? ColorStyles.lightGreen
                      : ColorStyles.red)
                  .withOpacity(0.2),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: new Center(
                child: new Icon(
              (budgetType == BudgetType.INFLOW)
                  ? Icons.arrow_upward
                  : Icons.arrow_downward,
              color: ((budgetType == BudgetType.INFLOW)
                  ? ColorStyles.lightGreen
                  : ColorStyles.red),
            ))),
        title: new Text(
          (budgetType == BudgetType.INFLOW) ? "RECEIVED FROM" : "SPENT ON",
          style: TextStyles.smallMedium
              .copyWith(color: ColorStyles.secondaryTextColor),
        ),
        subtitle: new Text(source, style: TextStyles.body),
        trailing: new Text(
          ((budgetType == BudgetType.INFLOW) ? "+" : "-") +
              "\$${amount.toString()}",
          style: TextStyles.body.copyWith(
              color: ((budgetType == BudgetType.INFLOW)
                  ? ColorStyles.lightGreen
                  : ColorStyles.red)),
        ),
      ),
    );
  }
}
