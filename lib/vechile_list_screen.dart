import 'package:flutter/material.dart';
import 'package:flutter_demo/vehicle.dart';

class VechileListScreen extends StatelessWidget {
  const VechileListScreen({super.key});

  List<Vehicle> get vehicles => [
    Vehicle(name: "Toyoto", fuelEfficiency: 16.5, age: 2, model: '2022'),
    Vehicle(name: "Nissian", fuelEfficiency: 20.7, age: 1, model: '2024'),
    Vehicle(name: "Shift", fuelEfficiency: 19, age: 5, model: '2020'),
    Vehicle(name: "Creta", fuelEfficiency: 12, age: 9, model: '2018'),
    Vehicle(name: "Venue", fuelEfficiency: 13.1, age: 7, model: '2012'),
    Vehicle(name: "Baleno", fuelEfficiency: 16.7, age: 2, model: '2000'),
    Vehicle(name: "Mahindra", fuelEfficiency: 18, age: 8, model: '2016'),
    Vehicle(name: "Ford", fuelEfficiency: 14.2, age: 3, model: '2014'),
    Vehicle(name: "BMW", fuelEfficiency: 10.4, age: 2, model: '2009'),
  ];

  Color getVehicleColor(Vehicle vehicle) {
    if(vehicle.fuelEfficiency >= 15) {
      if (vehicle.age <= 5) {
        return Colors.green;
      }
      return Colors.amber;
    }
    return Colors.red;
  }

  String getEfficiencyStatus(Vehicle vehicle) {
    if (vehicle.fuelEfficiency >= 15) {
      if (vehicle.age <= 5) {
        return "Fuel Efficient & Low Pollutant";
      }
      return "Fuel Efficient & Moderate Pollutant";
    }
    return "Less Efficient & High Pollutant";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vechile Efficiency Monitor'),
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: vehicles.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (context,index) {
          final vehicle = vehicles[index];
          final color = getVehicleColor(vehicle);

          return Card(
           elevation: 2,
           margin: EdgeInsets.symmetric(vertical: 4),
           child: ListTile(
            leading: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            title: Text(
              vehicle.name,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Model: ${vehicle.model}'),
                Text('Efficiency: ${vehicle.fuelEfficiency.toStringAsFixed(1)} km/l'),
                Text('Age : ${vehicle.age} years'),
                Text(
                  getEfficiencyStatus(vehicle),
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
            isThreeLine: true,
           ),
          );
        }
      ),
    );
  }
}