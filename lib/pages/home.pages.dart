import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_alchool_or_gasoline/widgets/logo.widget.dart';
import 'package:flutter_alchool_or_gasoline/widgets/submit-form.dart';
import 'package:flutter_alchool_or_gasoline/widgets/success.widget.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final defaultColor = Colors.deepPurple;
  final loadingColor = Colors.deepPurpleAccent;
  final alcoholColor = Colors.lightBlue;
  final gasolineColor = Colors.deepOrange;

  Color _color = Colors.deepPurple;

  var _gasCtrl = new MoneyMaskedTextController();
  var _alcoholCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _complete = false;
  var _resultText = "Compensa utilizar álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ?
            // Orientation.portrait
            ListView(
                children: <Widget>[
                  Logo(),
                  body(),
                ],
              )
            :
            // Orientation.landscape
            Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Logo(),
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: body(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Future calculate() {
    double alc = double.parse(
          _alcoholCtrl.text.replaceAll(new RegExp(r'[,.]'), ''),
        ) /
        100;
    double gas = double.parse(
          _gasCtrl.text.replaceAll(new RegExp(r'[,.]'), ''),
        ) /
        100;
    double result = alc / gas;

    setState(() {
      _color = loadingColor;
      _complete = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (result >= 0.7) {
          _resultText = "Compensa utilizar Gasolina!";
          _color = gasolineColor;
        } else {
          _resultText = "Compensa utilizar Álcool!";
          _color = alcoholColor;
        }

        _busy = false;
        _complete = true;
      });
    });
  }

  reset() {
    setState(() {
      _color = defaultColor;
      _alcoholCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();
      _complete = false;
      _busy = false;
    });
  }

  body() {
    return _complete
        ? Success(
      color: _color,
      reset: reset,
      result: _resultText,
    )
        : SubmitForm(
      alcoholCtrl: _alcoholCtrl,
      gasCtrl: _gasCtrl,
      busy: _busy,
      submitFunction: calculate,
      color: _color,
    );
  }
}
