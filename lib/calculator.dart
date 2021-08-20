import 'package:flutter/material.dart';

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
  var _currencies = ["Dollars", "Pounds", "Cents"];
  var _currentSelectedItem = '';

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  String displayResult = '';

  @override
  void initState() {
    super.initState();
    _currentSelectedItem = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              getAssetImage(),
              TextFormField(
                style: textStyle,
                controller: principalController,
                // ignore: missing_return
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please Enter Principal Amount';
                  }
                },
                decoration: InputDecoration(
                  labelStyle: textStyle,
                  labelText: 'Principal',
                  hintText: 'Enter pricipal, e.g 1200',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: textStyle,
                controller: roiController,
                // ignore: missing_return
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please Enter Rate Of Interest';
                  }
                },
                decoration: InputDecoration(
                  labelStyle: textStyle,
                  labelText: 'Rate',
                  hintText: 'Rate of Interest',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: textStyle,
                      controller: termController,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter Term';
                        }
                      },
                      decoration: InputDecoration(
                        labelStyle: textStyle,
                        labelText: 'Term',
                        hintText: 'Tme in Years',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                        items: _currencies.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        value: _currentSelectedItem,
                        onChanged: (String valueSelected) =>
                            _onDropdownValueSelected(valueSelected)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).primaryColorLight,
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState.validate()) {
                            displayResult = _calculateTotalreturns();
                          }
                        });
                      },
                      child: Text('Calculate'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                      child: Text('Reset'),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(displayResult),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getAssetImage() {
    AssetImage assetImage = AssetImage("images/minion.jpg");
    Image image = Image(image: assetImage, width: 300, height: 200);
    return Container(child: image);
  }

  void _onDropdownValueSelected(valueselected) {
    setState(() => _currentSelectedItem = valueselected);
  }

  String _calculateTotalreturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;
    String result =
        "Afeter $term years your total investment will be $totalAmountPayable in $_currentSelectedItem";
    return result;
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentSelectedItem = _currencies[0];
  }
}
