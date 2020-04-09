import 'package:flutter/material.dart';

class ErrorStateDisplay extends StatelessWidget
{
  final String errorMessage;

  ErrorStateDisplay ({Key  key, @required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      height: (MediaQuery.of(context).size.height) / 4,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            this.errorMessage,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    
    );
  }
  
}