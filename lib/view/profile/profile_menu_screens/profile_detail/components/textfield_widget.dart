import 'package:flutter/material.dart';

import '../../../../../uiprinciples/size_config.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key key,
    this.maxLines = 1,
    this.label,
    this.text,
    this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            widget.label,
            style: TextStyle(color: Colors.black87, fontSize: 15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(21, 0, 0, 0),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                  controller: _controller,
                  decoration: const InputDecoration(
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(8),
                  ),
                  maxLines: widget.maxLines,
                ),
              ),
            ],
          )
        ],
      );
}

/*
*/
