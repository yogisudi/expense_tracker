import 'package:flutter/material.dart';
import 'package:expense_tracker/styles/color_styles.dart';
import 'package:expense_tracker/styles/text_styles.dart';
import 'package:expense_tracker/pages/calculator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expense_tracker/pages/report.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 24.0),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "WELCOME TO",
              style: TextStyles.smallMedium
                  .copyWith(color: ColorStyles.secondaryTextColor),
            ),
            new SizedBox(height: 8.0),
            Text(
              "BUDGET TRACKER",
              style: TextStyles.humongous.copyWith(fontWeight: FontWeight.w900),
            ),
            new Container(
                margin: const EdgeInsets.only(top: 16.0),
                height: 120.0,
                decoration: BoxDecoration(
                  color: ColorStyles.lightGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Container(
                      height: 90.0,
                      width: 140.0,
                      decoration: new BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/budget_wallet.png"),
                      )),
                    ),
                    new Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                      ),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "Your Balance",
                            style: TextStyles.smallMedium
                                .copyWith(color: ColorStyles.gray),
                          ),
                          new SizedBox(height: 12.0),
                          new Text(
                            "\$0.00",
                            style: TextStyles.humongous
                                .copyWith(color: ColorStyles.lightGreen),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            new SizedBox(height: 24.0),
            Expanded(
              child: new Column(
                children: <Widget>[
                  //budget actions
                  new Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12.0),
                      child: new Row(
                        children: <Widget>[
                          //cash inFlow
                          new Expanded(
                            flex: 1,
                            child: new GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => new CalculatorPage()));
                              },
                              child: new Container(
                                decoration: new BoxDecoration(
                                  color: ColorStyles.faintBlue,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                padding: const EdgeInsets.all(24.0),
                                margin: const EdgeInsets.only(right: 12.0),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new SvgPicture.asset(
                                      "assets/svg/cash_inward.svg",
                                      color: ColorStyles.primaryAccent,
                                    ),
                                    new SizedBox(height: 24.0),
                                    new Text(
                                      "Add Inflow",
                                      style: TextStyles.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          //cash outflow
                          new Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => new CalculatorPage()));
                              },
                              child: new Container(
                                decoration: new BoxDecoration(
                                  color: ColorStyles.faintBlue,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                padding: const EdgeInsets.all(24.0),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new SvgPicture.asset(
                                      "assets/svg/cash_outward.svg",
                                      color: ColorStyles.red.withOpacity(0.8),
                                    ),
                                    new SizedBox(height: 24.0),
                                    new Text(
                                      "Add Outflow",
                                      style: TextStyles.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  //report
                  new Expanded(
                    flex: 1,
                    child: new GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            new MaterialPageRoute(
                                builder: (context) => new ReportPage()));
                      },
                      child: new Row(mainAxisSize: MainAxisSize.max, children: [
                        Expanded(
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: ColorStyles.faintBlue,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            padding: const EdgeInsets.all(24.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new SvgPicture.asset(
                                  "assets/svg/report.svg",
                                  color:
                                      ColorStyles.primaryAccent.withOpacity(0.6),
                                ),
                                new SizedBox(height: 24.0),
                                new Text(
                                  "Report",
                                  style: TextStyles.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
