import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget
{
  final String title;
  final String description;
  final String buttonText;
  final Image image;

  const CustomDialog({Key key, @required this.title, @required this.description, @required this.buttonText, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding)
      ),
      elevation: 1.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

dialogContent(BuildContext context)
  {
     return Stack(
       children: <Widget>[
         Container(
  padding: EdgeInsets.only(
    top: Consts.avatarRadius + Consts.padding,
    bottom: Consts.padding,
    left: Consts.padding,
    right: Consts.padding,
  ),
  margin: EdgeInsets.only(top: Consts.avatarRadius),
  decoration: new BoxDecoration(
    color: Theme.of(context).accentColor,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(Consts.padding),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0,
        offset: const Offset(0.0, 10.0),
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min, // To make the card compact
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: 3.0
        ),
      ),
      SizedBox(height: 16.0),
      Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.0,
           color: Colors.white,
           letterSpacing: 2.0
        ),
      ),
      SizedBox(height: 24.0),
      Align(
        alignment: Alignment.bottomRight,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
            side: BorderSide(color:Colors.green)
          ),
          color: Colors.green,
          onPressed: () {
            Navigator.of(context).pop(); // To close the dialog
          },
          child: Text(buttonText,  style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor)),
        ),
      ),
    ],
  ),
),
         Positioned(
  left: Consts.padding,
  right: Consts.padding,
  child: CircleAvatar(
    child: ClipOval(
      child: Image.asset('lib/images/about.png', width: 80, height: 80, fit: BoxFit.fill,),
    ),
    backgroundColor: Colors.green,
    radius: Consts.avatarRadius,
  ),
),
       ],
     );
  }

}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}