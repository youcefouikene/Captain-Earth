import 'package:flutter/material.dart';
import '../backend/progress_controllers.dart';
import '../data/data.dart';

late ChildProgress childProgress;
// late ThemeProgress themeProgress;
late GameProgress gameProgress;

late List<ThemeCard> themes;

bool celebrateTrophie = false;
Widget celebration = SizedBox();
late String unlockedTheme;
