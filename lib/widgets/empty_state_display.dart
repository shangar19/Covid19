import 'package:flutter/material.dart';

class EmptyStateDisplay extends StatelessWidget {
  final String message;
  final Color messageColor;

  const EmptyStateDisplay({Key key, @required this.message, this.messageColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      height: (MediaQuery.of(context).size.height) / 4,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            this.message,
            style: TextStyle(fontSize: 14, color: this.messageColor,fontFamily: 'Cynzia' ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    
    );
  
  }
}