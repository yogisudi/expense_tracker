
import 'package:flutter/material.dart';
import 'package:expense_tracker/styles/color_styles.dart';
import 'package:expense_tracker/styles/text_styles.dart';
import 'package:expense_tracker/widget/custom.dart';



class FormTextField extends StatefulWidget {
  final String hintText;
  final TextInputType inputType;
  final Function(String value) onSave;
  final Function onFocus;
  final Function(String value) validator;
  final Widget trailing;

  FormTextField({
    this.hintText,
    this.inputType: TextInputType.text,
    this.onSave,
    this.validator,
    this.trailing,
    this.onFocus,
  });

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  final FocusNode _focusNode = new FocusNode();


  @override
  void initState(){
    super.initState();
    _focusNode.addListener(widget.onFocus);
  }

  @override
  void dispose(){
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: new TextFormField(
            controller: _textEditingController,
            cursorColor: ColorStyles.primaryColor,
            focusNode: _focusNode,
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: widget.hintText ?? "",
              suffixIcon: Visibility(
                  visible: widget.trailing != null, child: widget.trailing ?? new Container()),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide(
                  width: 1.0,
                  color: ColorStyles.border,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide:
                    BorderSide(width: 2.0, color: ColorStyles.primaryColor),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              hintStyle: TextStyles.body,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide(width: 2.0, color: ColorStyles.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide(width: 2.0, color: ColorStyles.red),
              ),
            ),
            style: TextStyles.body,
            keyboardType: widget.inputType,
            textAlign: TextAlign.left,
            onSaved: widget.onSave));
  }
}

class SearchableTextField extends StatefulWidget {
  final List<String> values;
  final String searchHint;

  final Function(String) onItemSelected;

  SearchableTextField({
    @required this.values,
    this.onItemSelected,
    this.searchHint,
  }) : assert(values != null);

  @override
  _SearchableTextFieldState createState() => _SearchableTextFieldState();
}

class _SearchableTextFieldState extends State<SearchableTextField> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  final FocusNode _focusNode = new FocusNode();
  List<String> items;
  String selectedItem = "";

  @override
  void initState() {
    items = widget.values;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> newItems = items;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: new TextFormField(
              controller: _textEditingController,
              cursorColor: ColorStyles.primaryColor,
              focusNode: _focusNode,
              decoration: InputDecoration(
                  hintText: widget.searchHint ?? "",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: ColorStyles.border,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide:
                        BorderSide(width: 2.0, color: ColorStyles.primaryColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  hintStyle: TextStyles.body,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(width: 2.0, color: ColorStyles.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(width: 2.0, color: ColorStyles.red),
                  ),
                  suffix: new GestureDetector(
                    onTap: () => _focusNode.requestFocus(),
                    child: Icon(Icons.search, color: ColorStyles.gray),
                  )),
              style: TextStyles.body,
              keyboardType: TextInputType.multiline,
              textAlign: TextAlign.left,
              onSaved: widget.onItemSelected,
              onChanged: (String value) async {
                newItems = <String>[];

                if (value.length == 0) {
                  newItems = widget.values;
                } else {
                  widget.values.forEach((String data) {
                    if (data.toLowerCase().contains(value.toLowerCase())) {
                      newItems.add(data);
                    }
                  });
                }
                setState(() {
                  items = newItems;
                });
              },
            )),
        Visibility(
          visible: newItems.length > 0,
          child: new Container(
              padding: const EdgeInsets.all(8.0),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: ColorStyles.background,
              ),
              child: new ListView.builder(
                padding: const EdgeInsets.all(0.0),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  //options to add custom field
                  if (index == newItems.length) {
                    return GestureDetector(
                      onTap: () {
                        //todo: open dialog to open custom editing field to add
                      },
                      child: new Container(
                        height: 52.0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        child: new DashedRect(
                          child: new Text(
                            "Add Custom",
                            style: TextStyles.bodyMedium.copyWith(
                                color: ColorStyles.secondaryTextColor),
                          ),
                        ),
                      ),
                    );
                  }

                  return new GestureDetector(
                    onTap: () {
                      _textEditingController.text = items[index];

                      if (widget.onItemSelected != null) {
                        widget.onItemSelected(items[index]);
                      }

                      setState(() {
                        items = <String>[];
                        newItems = items;
                      });
                    },
                    child: buildSuggestionItem(items[index]),
                  );
                },
                itemCount: (newItems.length + 1),
              )),
        ),
      ],
    );
  }

  Widget buildSuggestionItem(String data) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(bottom: 4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: new Text(
          data,
          style: TextStyles.body,
        ));
  }
}
