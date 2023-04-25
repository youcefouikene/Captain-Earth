import 'dart:ui' as ui;

import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'jigsaw_puzzle.dart';
import 'jigsaw_puzzle_card_border_light.dart';
import 'jigsaw_puzzle_data.dart';


class JigsawPuzzlePreviewWidget extends StatefulWidget {

  final ui.Image srcImage;
  final Function(int) correctCallback;

  const JigsawPuzzlePreviewWidget({
    super.key,
    required this.srcImage,
    required this.correctCallback,
  });

  @override
  _JigsawPuzzlePreviewWidgetState createState() => _JigsawPuzzlePreviewWidgetState();
}

class _JigsawPuzzlePreviewWidgetState extends State<JigsawPuzzlePreviewWidget> {
  final Map<int, Widget> _previewImageCardMap = {};
  final List<Widget> _jigsawPuzzleCardLightBorderList = [];

  @override
  void initState() {
    super.initState();
    _generateJigsawPuzzleCardWidgetList();
  }

  @override
  Widget build(BuildContext context) {
    return _buildTargetAreaWidget(context);
  }

  void _generateJigsawPuzzleCardWidgetList() {
    _previewImageCardMap.clear();
    _previewImageCardMap.addAll(JigsawPuzzleDataGenerator.generatePreviewImageJigsawPuzzleCardWidgetMap(
      image: widget.srcImage,
      onCorrectCallback: (int id, JigsawPuzzleData data) {

        setState(() {
          _jigsawPuzzleCardLightBorderList.add(_buildCorrectBorderLightWidget(data));
          widget.correctCallback(id);
        });
      },
      onErrorCallback: (int id, JigsawPuzzleData data) {
        setState(() {
          _jigsawPuzzleCardLightBorderList.add(_buildErrorBorderLightWidget(data));
        });
      },
    ));

    if (_previewImageCardMap.isEmpty) {
      print('the image in empty');

    } else {
      setState(() {});
    }
  }

  Widget _buildTargetAreaWidget(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: _buildPreviewImageWidget(),
      ),
    );
  }

  Widget _buildPreviewImageWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          ..._previewImageCardMap.values,
          ..._jigsawPuzzleCardLightBorderList,
        ],
      ),
    );
  }

 
  Widget _buildCorrectBorderLightWidget(JigsawPuzzleData data) {
    return Positioned(
      left: data.left,
      top: data.top,
      child: OpacityAnimatedWidget(
        enabled: true,
        duration: const Duration(milliseconds: 2000),
        values: const [0, 1, 0],
        child: JigsawPuzzleCardBorderLightWidget(
          data: data,
          color: const Color.fromRGBO(158, 231, 251, 1),
        ),
        animationFinished: (_) {
          setState(() {
            _jigsawPuzzleCardLightBorderList.clear();
          });
        },
      ),
    );
  }


  Widget _buildErrorBorderLightWidget(JigsawPuzzleData data) {
    return Positioned(
      left: data.left,
      top: data.top,
      child: OpacityAnimatedWidget(
        enabled: true,
        duration: const Duration(milliseconds: 2000),
        values: const [0, 1, 0, 1, 0, 1, 0],
        child: JigsawPuzzleCardBorderLightWidget(
          data: data,
          color: const Color(0XFFFF7C6E),
        ),
        animationFinished: (_) {
          setState(() {
            _jigsawPuzzleCardLightBorderList.clear();
          });
        },
      ),
    );
  }
}
