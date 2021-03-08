import 'package:flutter/material.dart';

class SearchBarTemplate extends StatefulWidget {
  final Function setBodyItem;

  const SearchBarTemplate({Key key, this.setBodyItem}) : super(key: key);

  @override
  _SearchBarTemplateState createState() => _SearchBarTemplateState();
}

class _SearchBarTemplateState extends State<SearchBarTemplate> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: size.width,
          child: TextField(
            cursorColor: Colors.white,
            onChanged: widget.setBodyItem,
            decoration: InputDecoration(
              focusColor: Colors.white,
              fillColor: Colors.white,
              labelText: "Search",
              hintText: "Search",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))
              )
            ),
          ),
        )
    );
  }
}
