class DechetModel {
  final String name;
  final String img;
  final String value;
  bool accepting;

  DechetModel(
      {required this.name,
      required this.img,
      required this.value,
      this.accepting = false});
}

List<DechetModel> myDechetList = [
  // Organic
  DechetModel(
    name: 'bannana',
    value: '1',
    img: 'assets/images/oceanie/banana.png',
  ),
  DechetModel(
    name: 'apple',
    value: '1',
    img: 'assets/images/dechets/apple.png',
  ),
  DechetModel(
    name: 'melon',
    value: '1',
    img: 'assets/images/dechets/melon.png',
  ),
  DechetModel(
    name: 'steak',
    value: '1',
    img: 'assets/images/dechets/steak.png',
  ),
  // Paper
  DechetModel(
    name: 'feuillePapier1',
    value: '2',
    img: 'assets/images/dechets/feuillePapier1.png',
  ),
  DechetModel(
    name: 'feuillePapier2',
    value: '2',
    img: 'assets/images/dechets/feuillePapier2.png',
  ),
  DechetModel(
    name: 'journal',
    value: '2',
    img: 'assets/images/dechets/journal.png',
  ),
  DechetModel(
    name: 'carton',
    value: '2',
    img: 'assets/images/dechets/carton.png',
  ),
  // Glass
  DechetModel(
    name: 'verre1',
    value: '3',
    img: 'assets/images/dechets/verre.png',
  ),
  DechetModel(
    name: 'verre2',
    value: '3',
    img: 'assets/images/dechets/trashGlass1.png',
  ),
  DechetModel(
    name: 'trashGlass2',
    value: '3',
    img: 'assets/images/dechets/trashGlass2.png',
  ),
  DechetModel(
    name: 'saltBottle',
    value: '3',
    img: 'assets/images/dechets/saltBottle.png',
  ),
  // Plastic
  DechetModel(
    name: 'bouteillePlastique1',
    value: '4',
    img: 'assets/images/dechets/bouteille_plastique_1.png',
  ),
  DechetModel(
    name: 'bouteillePlastique2',
    value: '4',
    img: 'assets/images/dechets/bouteille_plastique_2.png',
  ),
  DechetModel(
    name: 'plasticTrash2',
    value: '4',
    img: 'assets/images/dechets/plasticTrash2.png',
  ),
  DechetModel(
      name: 'sachet', value: '4', img: 'assets/images/dechets/sachet.png'),
];

List<DechetModel> myPoubelleList = [
  DechetModel(
      name: 'Organic',
      img: 'assets/images/dechets/poubelle-organique.png',
      value: '1'),
  DechetModel(
      name: 'Paper',
      img: 'assets/images/dechets/poubelle-papier.png',
      value: '2'),
  DechetModel(
      name: 'Glass',
      img: 'assets/images/dechets/poubelle-verre.png',
      value: '3'),
  DechetModel(
      name: 'Plastic',
      img: 'assets/images/dechets/poubelle-plastique.png',
      value: '4'),
];
