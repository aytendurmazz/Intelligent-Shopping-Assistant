import 'dart:math' as math;
import 'dart:ui';

import 'package:assistant/camera_config/bounding_box.dart';
import 'package:assistant/camera_config/camera.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tflite/tflite.dart';

class LiveFeed extends StatefulWidget {
  final List<CameraDescription> cameras;
  LiveFeed(this.cameras);
  @override
  _LiveFeedState createState() => _LiveFeedState();
}

class _LiveFeedState extends State<LiveFeed> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  bool b;

  var scr = new GlobalKey();
  initCameras() async {}
  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/module/ayten.tflite",
      labels: "assets/module/ayten.txt",
    );
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    if (mounted) {
      setState(() {
        _recognitions = recognitions;
        _imageHeight = imageHeight;
        _imageWidth = imageWidth;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadTfModel();
    b = true;
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        CameraFeed(widget.cameras, setRecognitions),
        BoundingBox(
          _recognitions == null ? [] : _recognitions,
          math.max(_imageHeight, _imageWidth),
          math.min(_imageHeight, _imageWidth),
          screen.height,
          screen.width,
        ),
      ],
    );
  }
}
