// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/ice_cream.dart';
import 'package:flutter_application_1/widget/ice_cream_front.dart';
import 'package:flutter_application_1/widget/ice_cream_inside.dart';
import 'package:folding_cell/folding_cell.dart';

class IceCreamWidget extends StatefulWidget {
  const IceCreamWidget({Key key, this.iceCream}) : super(key: key);
  final IceCream iceCream;
  @override
  _IceCreamWidgetState createState() => _IceCreamWidgetState();
}

class _IceCreamWidgetState extends State<IceCreamWidget> {
  int iceBallCount = 1;
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: SimpleFoldingCell.create(
        key: _foldingCellKey,
        frontWidget: IceCreamFrontWidgetTemp(),
        innerWidget: IceCreamInsideWidgetTemp(),
        cellSize: Size(MediaQuery.of(context).size.width, 125),
        padding: EdgeInsets.all(16),
        animationDuration: Duration(milliseconds: 300),
        borderRadius: 10,
        onOpen: () => print('cell opened'),
        onClose: () => print('cell closed'),
      ),
    );
  }

  Column buildCream(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.iceCream.name,
          style: Theme.of(context).primaryTextTheme.headline6,
        ),
        SizedBox(height: 8.0,),
        OutlineButton(
            textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
          onPressed: (){
            _foldingCellKey.currentState.toggleFold();
          },
           
          child: Row(
            children: <Widget>[
              Icon(Icons.open_in_new),
              SizedBox(
                width: 16.0,
              ),
              Text("Open"),
            ],
            mainAxisSize: MainAxisSize.min,
            )
          )
      ],
    );

  }


  Widget IceCreamFrontWidgetTemp() {
    return Container(
      color: Color(0xFFffcd3c),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Image.asset( 
          widget.iceCream.image,
          fit: BoxFit.cover
,        ),
        title: Stack(
          children: <Widget>[
            buildCream(context),
          ],
        ),
      ),
    );
  }

  Widget IceCreamInsideWidgetTemp() {
    return Container(
        color: Color(0xFFecf2f9),
        padding: EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "CARD TITLE",
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "CARD DETAIL",
                )),
            Positioned(
                right: 10,
                bottom: 10,
                child: TextButton(
                  onPressed: () {
                    _foldingCellKey.currentState.toggleFold();
                  },
                  child: Text("Close"),
                )),
          ],
        ));
  }

}
