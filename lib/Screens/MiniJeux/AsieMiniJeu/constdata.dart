import 'package:flutter/material.dart';

List<Color> colors = [
  Colors.green,
  Colors.red,
  Colors.grey,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.teal,
];
int size = 6;
double dim = 60.0;
double boardDim = dim * size;

List<Map<String, List<String>>> boards = [
  // {
  //   'game': ["SLAIT*", "*A***O", "**L**E", "***A*U", "****DF", "*****E"],
  //   'words': ['LAIT', 'OEUF', 'SALADE'],
  // },

  {
    'game': ["ACIDEF", "*Z***U", "**O**M", "***T*É", "****EE", "CLIMAT"],
    'words': ['ACIDE', 'AZOTE', 'FUMÉE', 'CLIMAT'],
  },

  {
    'game': ["MOTEUR", "*G****", "**A***", "***Z**", "OZONE*", "OXYDE*"],
    'words': ['MOTEUR', 'GAZ', 'OZONE', 'OXYDE'],
  },

  // {
  //   'game': ["AMANDE", "*P****", "**A***", "**RIZ*", "****N*", "MIEL**"],
  //   'words': ['AMANDE', 'PAIN', 'RIZ', 'MIEL'],
  // },
  {
    'game': ["VELO*P", "*A***O", "**I**L", "***R*L", "*****U", "USINEÉ"],
    'words': ['VELO', 'POLLUÉ', 'USINE', 'AIR'],
  },
  // {
  //   'game': ["**É**C", "**D**A", "*RA**N", "POMMET", "*U***A", "*Y***L"],
  //   'words': ['CANTAL', 'ÉDAM', 'POMME', 'ROUY'],
  // },
  // {
  //   'game': ["LCURRY", "*É****", "**G***", "*FRUIT", "****M*", "SALADE"],
  //   'words': ['LÉGUME', 'CURRY', 'FRUIT', 'SALADE'],
  // },
  // {
  //   'game': ["*F****", "RAISIN", "***G**", "****U*", "*DATTE", "CASSIS"],
  //   'words': ['FIGUE', 'CASSIS', 'RAISIN', 'DATTE'],
  // },
  // {
  //   'game': ["F****H", "*E*S*U", "**RO*I", "MOULET", "***E*R", "*****E"],
  //   'words': ['SOLE', 'FER', 'HUITRE', 'MOULE'],
  // },
  // {
  //   'game': ["*SEL**", "**RI**", "**B*O*", "**I**F", "**F***", "*REPAS"],
  //   'words': ['FIBRE', 'FOIE', 'REPAS', 'SEL'],
  // },

  //DERNIERS THÈMES :
  // {
  //   'game': ["CRAMPE", "******", "NAUSÉE", "PÊCHE*", "******", "STRESS"],
  //   'words': ['PÊCHE', 'NAUSÉE', 'STRESS', 'CRAMPE'],
  // },

  // {
  //   'game': ["O****A", "*BF**N", "**ÈE*É", "***SRM", "****EI", "MALADE"],
  //   'words': ['OBÈSE', 'FER', 'ANÉMIE', 'MALADE'],
  // },
  // {
  //   'game': ['*SF**B', '*A*E*R', '*M**UÛ', 'FUMÉEL', '*****É', '******'],
  //   'words': ['SAMU', 'FUMÉE', 'FEU', 'BRÛLÉ']
  // },
  // {
  //   'game': ['U*RS*C', '*REA*H', '**GP*U', '**NE*T', '**AUNE', '**DR*T'],
  //   'words': ['URGENT', 'DANGER', 'CHUTE', 'SAPEUR']
  // }
];
