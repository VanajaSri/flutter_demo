class AllPlantsModel {
  final String name, image, height, temparature, pot;
  final String? category;
  final double price;

  AllPlantsModel({
    required this.name,
    required this.image,
    required this.height,
    required this.temparature,
    required this.pot,
    this.category,
    required this.price,
  });
}

List<AllPlantsModel> plants = [
  AllPlantsModel(
    name: "Snake Plants",
    image: 'assests/snake-plants.png',
    height: '20cm - 35cm',
    temparature: '11*C - 22*C',
    pot: 'Soil Pot',
    price: 12.99,
  ),
  AllPlantsModel(
    name: "Lucky Jade Plant",
    image: 'assests/lucky-jade-plants.png',
    height: '30cm - 35cm',
    temparature: '20*C - 25*C',
    pot: 'Ceramic Pot',
    price: 12.99,
    category: 'Super Greens',
  ),
  AllPlantsModel(
    name: "Small Plants",
    image: 'assests/Small-Plant.png',
    height: '30cm - 45cm',
    temparature: '18*C - 25*C',
    pot: 'Soil Pot',
    price: 12.99,
  ),
  AllPlantsModel(
    name: "Peperomia Plants",
    image: 'assests/Peperomia_Plant.png',
    height: '50cm - 65cm',
    temparature: '11*C - 22*C',
    pot: 'Ceramic Pot',
    price: 12.99,
    category: 'Super Greens',
  ),
  AllPlantsModel(
    name: "Mini Plant",
    image: 'assests/Mini_Plant.png',
    height: '10cm - 25cm',
    temparature: '11*C - 22*C',
    pot: 'Wood Pot',
    price: 12.99,
  ),
];


