import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'jigsaw_puzzle_pick_area.dart';
import 'jigsaw_puzzle_preview.dart';
import 'utils.dart';


class JigsawPuzzlePage extends StatefulWidget {

  @override
  _JigsawPuzzlePageState createState() => _JigsawPuzzlePageState();
}

class _JigsawPuzzlePageState extends State<JigsawPuzzlePage> {

  ui.Image? _srcImage;

  final List<int> _correctIdList = [];

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async {
    _srcImage =
    await ImageUtils.loadAssetImage('assets/images/sandwich.png');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_srcImage == null) {
      return Container();
    }
    return _buildPageContentWidget();
  }

  Widget _buildPageContentWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromRGBO(158,231,251,1),

      child: Transform.scale(
        scale: 0.8,
        child: Row(
          children: [
            JigsawPuzzlePreviewWidget(
              srcImage: _srcImage!,
              correctCallback: (id) {
                setState(() {
                  _correctIdList.add(id);
                });
              },
            ),
            JigsawPuzzlePickAreaWidget(
              srcImage: _srcImage!,
              correctIdList: _correctIdList,
            ),
          ],
        ),
      ),
    );
  }
}
