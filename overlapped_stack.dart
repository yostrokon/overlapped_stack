import 'package:flutter/material.dart';

class OverlappedStack extends StatelessWidget {
  List<Widget> _children;
  double _offset;
  Widget _empty;

  OverlappedStack({@required List<Widget> children, double offset = 20.0, Widget empty}){
    _children = children;
    _empty = empty;
  }

  List<Widget> _buildChildren(){
    List<Widget> _list = List();
    if(_children.length == 0) _list.add(_empty);
    else
      _children.forEach((widget)=>
        _list.add(Positioned(child: widget, left: _offset * _children.indexOf(widget),))
      );

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _buildChildren()
    );
  }
}
