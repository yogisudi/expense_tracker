
import 'package:flutter/material.dart';
import 'package:expense_tracker/styles/color_styles.dart';
import 'package:expense_tracker/styles/text_styles.dart';
import 'package:expense_tracker/widget/form_components.dart';
import 'package:expense_tracker/widget/buttons.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  String amount = "";
  String amountSource = "";
  final textControllerInput = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textControllerInput.addListener(() {});
  }

  @override
  void dispose() {
    textControllerInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                margin: const EdgeInsets.only(top: 24.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                          height: 100.0,
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: ColorStyles.lightGreen.withOpacity(0.2),
                          ),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Text("AMOUNT",
                                  style: TextStyles.smallMedium.copyWith(
                                      color: ColorStyles.secondaryTextColor)),
                              new SizedBox(height: 4.0),
                              new TextField(
                                decoration: new InputDecoration.collapsed(
                                    hintText: "0",
                                    hintStyle: TextStyles.humongous),
                                style: TextStyles.humongous,
                                textAlign: TextAlign.center,
                                controller: textControllerInput,
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(new FocusNode()),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 12.0),
                  child: new FormTextField(
                    hintText: "Select Source",
                    inputType: TextInputType.text,
                    onSave: (String value) {
                      amountSource = value;
                    },
                    onFocus: () {
                      //todo: yet to decide
                    },
                    validator: (String value) {
                      return ((value?.length ?? 0) == 0) ? "Enter source" : null;
                    },
                  ),
                ),
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      btn('7'),
                      btn('8'),
                      btn('9'),
                      btnAC(),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        btn('4'),
                        btn('5'),
                        btn('6'),
                        btnClear(),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      btn('1'),
                      btn('2'),
                      btn('3'),
                      btn('0'),
                    ],
                  ),
                  new SizedBox(height: 12.0),
                  new PrimaryButton(buttonText: "ADD",
                    onTap: (){
                    //check if the source is entered
                      if(_formKey.currentState.validate()){
                        //trigger the onSave callback of all the formfield in this key
                        _formKey.currentState.save();
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget btn(btnText) {
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: FlatButton(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            btnText,
            style: TextStyles.humongous,
          ),
        ),
        onPressed: () {
          setState(() {
            textControllerInput.text = textControllerInput.text + btnText;
          });
        },
        color: ColorStyles.background,
        padding: EdgeInsets.all(18.0),
        splashColor: ColorStyles.primaryAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      ),
    );
  }

  Widget btnClear() {
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: FlatButton(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Icon(Icons.backspace, size: 24.0, color: ColorStyles.gray)),
        onPressed: () {
          textControllerInput.text = (textControllerInput.text.length > 0)
              ? (textControllerInput.text
                  .substring(0, textControllerInput.text.length - 1))
              : "";
        },
        color: ColorStyles.background,
        padding: EdgeInsets.all(18.0),
        splashColor: ColorStyles.red.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }

  Widget btnAC() {
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: FlatButton(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: new Icon(
              Icons.refresh,
              size: 24.0,
              color: ColorStyles.red.withOpacity(0.8),
            )),
        onPressed: () {
          setState(() {
            textControllerInput.text = "";
          });
        },
        color: ColorStyles.background,
        padding: EdgeInsets.all(18.0),
        splashColor: ColorStyles.red.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
