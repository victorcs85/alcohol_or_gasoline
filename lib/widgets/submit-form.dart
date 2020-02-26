import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_alchool_or_gasoline/widgets/input.widget.dart';
import 'package:flutter_alchool_or_gasoline/widgets/loading.widget.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class SubmitForm extends StatelessWidget {
  var gasCtrl = new MoneyMaskedTextController();
  var alcoholCtrl = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunction;
  Color color = Colors.deepPurple;

  SubmitForm({
    @required this.gasCtrl,
    @required this.alcoholCtrl,
    @required this.busy,
    @required this.submitFunction,
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Gasolina",
            ctrl: gasCtrl,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Álcool",
            ctrl: alcoholCtrl,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        LoadingButton(
          text: "CALCULAR",
          invert: false,
          busy: busy,
          func: submitFunction,
          color: color,
        )
      ],
    );
  }
}
