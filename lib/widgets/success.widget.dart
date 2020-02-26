import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alchool_or_gasoline/widgets/loading.widget.dart';

class Success extends StatelessWidget {
  var result = "";
  Color color = Colors.deepPurple;
  Function reset;

  Success({
    @required this.color,
    @required this.result,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            // margin interna (padding)
            height: 30,
          ),
          Text(
            result,
            style: TextStyle(
              color: color,
              fontSize: 40,
              fontFamily: "Big Shoulders Display",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          LoadingButton(
            color: color,
            text: "CALCULAR NOVAMENTE",
            invert: true,
            busy: false,
            func: reset,
          )
        ],
      ),
    );
  }
}
