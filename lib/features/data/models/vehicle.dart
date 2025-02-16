class Vehicle {
  final String name;
  final double fuelEfficiency;
  final int age;
  final String model;
  final String image;
  final int capacity; 
  final double imageWidth;
  final double imageHeight;

  Vehicle({
    required this.name,
    required this.fuelEfficiency,
    required this.age,
    required this.model,
    required this.image,
    required this.capacity,
    this.imageWidth = 300,
    this.imageHeight = 200,
  });
}

List<Vehicle> get vehicles => [
  Vehicle(
    name: "Toyoto",
    fuelEfficiency: 16.5,
    age: 2,
    model: '2022',
    image: 'assets/cara.jpg',
    capacity: 6
  ),
  Vehicle(
    name: "Nissian",
    fuelEfficiency: 20.7,
    age: 1,
    model: '2024',
    image: 'assets/carb.jpg',
    capacity: 3
  ),
  Vehicle(
    name: "Shift",
    fuelEfficiency: 19,
    age: 5,
    model: '2020',
    image: 'assets/carc.jpg',
    capacity: 2
  ),
  Vehicle(
    name: "Creta",
    fuelEfficiency: 12,
    age: 9,
    model: '2018',
    image: 'assets/card.jpg',
    capacity: 3
  ),
  Vehicle(
    name: "Venue",
    fuelEfficiency: 13.1,
    age: 7,
    model: '2012',
    image: 'assets/care.jpg',
    capacity: 9
  ),
  Vehicle(
    name: "Baleno",
    fuelEfficiency: 16.7,
    age: 2,
    model: '2000',
    image: 'assets/carf.jpg',
    capacity: 7
  ),
  Vehicle(
    name: "Mahindra",
    fuelEfficiency: 18,
    age: 9,
    model: '2016',
    image: 'assets/carj.jpg',
    capacity: 4
  ),
  Vehicle(
    name: "Ford",
    fuelEfficiency: 14.2,
    age: 3,
    model: '2014',
    image: 'assets/cark.jpg',
    capacity: 1
  ),
];
