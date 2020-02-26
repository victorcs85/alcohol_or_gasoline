import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  Color color = Colors.deepPurple;
  var invert = false;
  Function func;
  var text = "";

  LoadingButton({
    @required this.color,
    @required this.busy,
    @required this.invert,
    @required this.func,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: EdgeInsets.all(30),
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: invert ? color : Colors.white.withOpacity(0.80),
              borderRadius: BorderRadius.circular(
                60,
              ),
            ),
            child: FlatButton(
              child: Text(
                "CALCULAR NOVAMENTE",
                style: TextStyle(
                    color:
                        invert ? Colors.white : Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontFamily: "Big Shoulders Display"),
              ),
              onPressed: func,
            ),
          );
  }
}
