import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'jigsaw_puzzle.dart';
import 'jigsaw_puzzle_card.dart';


class JigsawPuzzleDataGenerator {

  static final List<JigsawPuzzleData> _3x2dataList = [
    /// row 1
    JigsawPuzzleData(
      width: 208,
      height: 240,
      left: 0,
      top: 0,
      borderPath: 'M160,0 L160,75 C160,86.5979797 169.40202,96 181,96 C181.487961,96 181.972034,96.0166428 182.451684,96.0493917 C182.963713,96.0165423 183.479925,96 184,96 C197.254834,96 208,106.745166 208,120 C208,133.254834 197.254834,144 184,144 C183.479925,144 182.963713,143.983458 182.451863,143.95087 C181.972034,143.983357 181.487961,144 181,144 C169.40202,144 160,153.40202 160,165 L160,240 L125,240 C113.40202,240 104,230.59798 104,219 C104,218.512039 103.983357,218.027966 103.95087,217.548137 C103.983458,217.036287 104,216.520075 104,216 C104,202.745166 93.254834,192 80,192 C66.745166,192 56,202.745166 56,216 C56,216.520075 56.0165423,217.036287 56.0493917,217.548316 C56.0166428,218.027966 56,218.512039 56,219 C56,230.59798 46.5979797,240 35,240 L35,240 L4.54747351e-13,240 L4.54747351e-13,64 C4.50418687e-13,28.653776 28.653776,6.49299601e-15 64,0 L160,0 Z',
    ),
    JigsawPuzzleData(
      width: 160,
      height: 288,
      left: 160,
      top: 0,
      borderPath: 'M160,0 L160,75 C160,86.5979797 150.59798,96 139,96 C138.512039,96 138.027966,96.0166428 137.548316,96.0493917 C137.036287,96.0165423 136.520075,96 136,96 C122.745166,96 112,106.745166 112,120 C112,133.254834 122.745166,144 136,144 C136.520075,144 137.036287,143.983458 137.548137,143.95087 C138.027966,143.983357 138.512039,144 139,144 C150.59798,144 160,153.40202 160,165 L160,240 L124.882589,240.000321 C113.338633,240.063519 104,249.441182 104,261 C104,261.487961 103.983357,261.972034 103.95087,262.451863 C103.983458,262.963713 104,263.479925 104,264 C104,277.254834 93.254834,288 80,288 C66.745166,288 56,277.254834 56,264 C56,263.479925 56.0165423,262.963713 56.0493917,262.451684 C56.0166428,261.972034 56,261.487961 56,261 C56,249.519172 46.7869603,240.190164 35.3507743,240.00287 L35.116,240 L4.54747351e-13,240 L4.54747351e-13,165 C4.54747351e-13,153.40202 9.40202025,144 21,144 C21.4879607,144 21.9720342,143.983357 22.451863,143.95087 C22.9637133,143.983458 23.4799248,144 24,144 C37.254834,144 48,133.254834 48,120 C48,106.745166 37.254834,96 24,96 C23.4799248,96 22.9637133,96.0165423 22.451684,96.0493917 C21.9720342,96.0166428 21.4879607,96 21,96 C9.51917156,96 0.190163858,86.7869603 0.00287044917,75.3507743 L4.54747351e-13,75 L4.54747351e-13,0 L160,0 Z',
    ),
    JigsawPuzzleData(
      width: 208,
      height: 240,
      left: 272,
      top: 0,
      borderPath: 'M144,0 C179.346224,6.49299601e-15 208,28.653776 208,64 L208,64 L208,240 L173,240 C161.40202,240 152,230.59798 152,219 C152,218.512039 151.983357,218.027966 151.95087,217.548137 C151.983458,217.036287 152,216.520075 152,216 C152,202.745166 141.254834,192 128,192 C114.745166,192 104,202.745166 104,216 C104,216.520075 104.016542,217.036287 104.049392,217.548316 C104.016643,218.027966 104,218.512039 104,219 C104,230.59798 94.5979797,240 83,240 L83,240 L48,240 L48,165 C48,153.40202 38.5979797,144 27,144 C26.5120393,144 26.0279658,143.983357 25.548137,143.95087 C25.0362867,143.983458 24.5200752,144 24,144 C10.745166,144 4.54747351e-13,133.254834 4.54747351e-13,120 C4.54747351e-13,106.745166 10.745166,96 24,96 C24.5200752,96 25.0362867,96.0165423 25.548316,96.0493917 C26.0279658,96.0166428 26.5120393,96 27,96 C38.5979797,96 48,86.5979797 48,75 L48,75 L48,0 Z',
    ),
    /// row 2
    JigsawPuzzleData(
      width: 160,
      height: 288,
      left: 0,
      top: 192,
      borderPath: 'M80,0 C93.254834,0 104,10.745166 104,24 C104,24.5200752 103.983458,25.0362867 103.95087,25.548137 C103.983357,26.0279658 104,26.5120393 104,27 C104,38.5979797 113.40202,48 125,48 L159.999,48 L160,123 C160,134.480828 150.78696,143.809836 139.350774,143.99713 L139,144 C138.512039,144 138.027966,144.016643 137.548061,144.049125 C137.036235,144.016541 136.520049,144 136,144 C122.745166,144 112,154.745166 112,168 C112,181.254834 122.745166,192 136,192 C136.520049,192 137.036235,191.983459 137.548316,191.950608 C138.027966,191.983357 138.512039,192 139,192 C150.59798,192 160,201.40202 160,213 L160,213 L160,288 L160,287.999 L160,288 L64,288 C28.653776,288 4.4878403e-13,259.346224 4.44455366e-13,224 L4.55232258e-13,48 L35,48 C46.5979797,48 56,38.5979797 56,27 C56,26.5120393 56.0166428,26.0279658 56.0493917,25.548316 C56.0165423,25.0362867 56,24.5200752 56,24 C56,10.745166 66.745166,0 80,0 Z',
    ),
    JigsawPuzzleData(
      width: 256,
      height: 240,
      left: 112,
      top: 240,
      borderPath: 'M208.150524,-6.7785777e-11 L208.150524,75.0658541 C208.150524,86.6274637 217.52306,96 229.08467,96 C229.571496,96 230.05444,96.0166176 230.532132,96.0491198 C231.042327,96.016539 231.556869,96 232.075262,96 C245.28853,96 256,106.745166 256,120 C256,133.254834 245.28853,144 232.075262,144 C231.556869,144 231.042327,143.983461 230.532968,143.950684 C230.05444,143.983382 229.571496,144 229.08467,144 C217.52306,144 208.150524,153.372536 208.150524,164.934146 L208.150524,164.934146 L208.150524,240 L47.8494762,240 L47.8494762,164.934146 C47.8494762,153.372536 38.4769399,144 26.9153304,144 C26.4285043,144 25.9455595,143.983382 25.4670323,143.950684 C24.9576727,143.983461 24.4431308,144 23.9247381,144 C10.7114701,144 2.98427949e-13,133.254834 2.98427949e-13,120 C2.98427949e-13,106.745166 10.7114701,96 23.9247381,96 C24.4431308,96 24.9576727,96.016539 25.467868,96.0491198 C25.9455595,96.0166176 26.4285043,96 26.9153304,96 C38.4769399,96 47.8494762,86.6274637 47.8494762,75.0658541 L47.8494762,-9.33653155e-11 L83,-9.98170435e-11 C94.5979797,-9.98170435e-11 104,9.40202025 104,21 C104,21.4879607 104.016643,21.9720342 104.049392,22.451684 C104.016542,22.9637133 104,23.4799248 104,24 C104,37.254834 114.745166,48 128,48 C141.254834,48 152,37.254834 152,24 C152,23.4799248 151.983458,22.9637133 151.95087,22.451863 C151.983357,21.9720342 152,21.4879607 152,21 C152,9.557938 161.150927,0.253189483 172.533455,0.00508012798 L172.882589,0.000321316286 L208.150524,-6.7785777e-11 Z',
    ),
    JigsawPuzzleData(
      width: 160,
      height: 288,
      left: 320,
      top: 192,
      borderPath: 'M80,0 C66.745166,0 56,10.745166 56,24 C56,24.5200752 56.0165423,25.0362867 56.0491295,25.548137 C56.0166428,26.0279658 56,26.5120393 56,27 C56,38.5979797 46.5979797,48 35,48 L0.001,48 L2.84217094e-13,123 C2.84217094e-13,134.480828 9.21303974,143.809836 20.6492257,143.99713 L21,144 C21.4879607,144 21.9720342,144.016643 22.4519392,144.049125 C22.9637646,144.016541 23.4799506,144 24,144 C37.254834,144 48,154.745166 48,168 C48,181.254834 37.254834,192 24,192 C23.4799506,192 22.9637646,191.983459 22.451684,191.950608 C21.9720342,191.983357 21.4879607,192 21,192 C9.40202025,192 2.27373675e-13,201.40202 2.27373675e-13,213 L2.27373675e-13,213 L5.68434189e-14,288 L-4.54747351e-13,287.999 L-4.54747351e-13,288 L96,288 C131.346224,288 160,259.346224 160,224 L160,48 L125,48 C113.40202,48 104,38.5979797 104,27 C104,26.5120393 103.983357,26.0279658 103.950608,25.548316 C103.983458,25.0362867 104,24.5200752 104,24 C104,10.745166 93.254834,0 80,0 Z',
    ),
  ];


  static Map<int, Widget> generatePreviewImageJigsawPuzzleCardWidgetMap({
    required ui.Image? image,
    required Function(int id, JigsawPuzzleData data) onCorrectCallback,
    required Function(int id, JigsawPuzzleData data) onErrorCallback,
  }) {
    if (image == null) {
      return {};
    }
    Map<int, Widget> map = {};

    for (var data in _3x2dataList) {
      map[data.id()] = Positioned(
        key: Key(data.id().toString()),
        left: data.left,
        top: data.top,
        child: DragTargetJigsawPuzzleCardWidget(
          data: data,
          srcImage: image,
          onCorrectCallback: onCorrectCallback,
          onErrorCallback: onErrorCallback,
        ),
      );
    }
    return map;
  }

  static Map<int, Widget> generatePickJigsawPuzzleCardWidgetMap({
    required ui.Image? image,
    required List<int> correctIdList,
  }) {
    Map<int, Widget> map = {};
    if (image == null) {
      return map;
    }
    for (var data in _3x2dataList) {
      if (correctIdList.contains(data.id())) {
        continue;
      }
      map[data.id()] = DraggableJigsawPuzzleCardWidget(
        key: Key(data.id().toString()),
        data: data,
        srcImage: image,
      );
    }
    return map;
  }
}