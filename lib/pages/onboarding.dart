import 'package:flutter/material.dart';
import 'package:expense_tracker/styles/color_styles.dart';
import 'package:expense_tracker/styles/text_styles.dart';
import 'package:expense_tracker/widget/buttons.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expense_tracker/widget/generic.dart';
import 'package:expense_tracker/pages/home.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              flex: 2,
              child: new Container(
                decoration: new BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/wallet.png"),
                )),
              ),
            ),
            new Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(bottom: 32.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "Welcome to Budget Tracker",
                      style: TextStyles.humongous,
                    ),
                    new SizedBox(height: 24.0),
                    new Text(
                      "Keep Record of all your Expenses and Income.\nTrack, analyse and act.",
                      style: TextStyles.smallMedium
                          .copyWith(color: ColorStyles.secondaryTextColor),
                      textAlign: TextAlign.center,
                    ),
                    new SizedBox(height: 44.0),
                    new PrimaryButton(
                      buttonText: "START",
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            new MaterialPageRoute(
                                builder: (BuildContext context) {
                          return AppIntroPage();
                        }), (route) {
                          return true;
                        });
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class AppIntroPage extends StatefulWidget {
  @override
  _AppIntroPageState createState() => _AppIntroPageState();
}

class _AppIntroPageState extends State<AppIntroPage> {
  final _controller = PageController();

  SharedPreferences sharedPreferences;
  bool isFirstTime = true;
  bool hasEndReached = false;

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isFirstTime = sharedPreferences.getBool("isFirstTime");
      if (!isFirstTime) {
        //todo go to home page;
      }
    });
  }

  @override
  void initState() {
    getCredential();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 52.0),
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: PageView(
              controller: _controller,
              onPageChanged: (int index){
                //statically typed value for now
                if(index == 2){
                  hasEndReached = true;
                }else{
                  hasEndReached = false;
                }
              },
              children: <Widget>[
                //todo: change the app intro contents here
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: new IntroWidget(
                    imageAssetPath: "assets/images/track_expense.png",
                    title: "Track Buget",
                    content: "Manage all your transactions at one place. Add Inflow, Expenses and track them throughout the history.",
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: new IntroWidget(
                    imageAssetPath: "assets/images/track_expense.png",
                    title: "Generate Report",
                    content:
                        "Manage all your transactions at one place. Add Inflow, Expenses and track them throughout the history.",
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: new IntroWidget(
                    imageAssetPath: "assets/images/track_expense.png",
                    title: "Take Action",
                    content:
                        "Manage all your transactions at one place. Add Inflow, Expenses and track them throughout the history.",
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              height: MediaQuery.of(context).size.height / 6,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //skip the app introduction
                    new GestureDetector(
                      onTap: () {
                        setState(() {
                          sharedPreferences.setBool("isFirstTime", false);
                        });
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => new HomePage()));
                      },
                      child: Row(
                        children: <Widget>[
                          Text("Skip",
                              style: TextStyles.bodyMedium
                                  .copyWith(color: ColorStyles.gray)),
                        ],
                      ),
                    ),

                    PageIndicator(
                      layout: PageIndicatorLayout.SCALE,
                      activeColor: ColorStyles.primaryAccent,
                      color: ColorStyles.background,
                      size: 10.0,
                      controller: _controller,
                      space: 4.0,
                      count: 3,
                    ),

                    GestureDetector(
                      onTap: () {
                        if(!hasEndReached){
                          _controller.nextPage(
                              duration: kTabScrollDuration, curve: Curves.ease);
                        }else {
                          Navigator.of(context).pushReplacement(
                              new MaterialPageRoute(
                                  builder: (context) => new HomePage()));
                        }
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Next",
                            style: TextStyles.bodyMedium
                                .copyWith(color: ColorStyles.primaryAccent),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 25,
                            color: ColorStyles.primaryAccent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
