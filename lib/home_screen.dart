import 'package:flutter/material.dart';
import 'package:flutter_demo/car_detail_screen.dart';
import 'package:flutter_demo/vehicle.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, Color> getVehicleCondition(Vehicle vehicle) {
    if (vehicle.fuelEfficiency >= 15) {
      if (vehicle.age <= 5) {
        return {"New": Colors.green};
      }
      return {"Moderate": Colors.amber};
    }
    return {"Old": Colors.red};
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
      backgroundColor: Color(0xffececee),
      appBar: headerParts(),
      body: carList(context),
    );
  }

  SingleChildScrollView carList(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MasonryGridView(
            padding: EdgeInsets.symmetric(horizontal: 22),
            crossAxisSpacing: 25,
            mainAxisSpacing: 25,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              for (var vehicle in vehicles)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VehicleDetails(vehicle: vehicle),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Center(child: Image.asset(vehicle.image)),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      getVehicleCondition(
                                        vehicle,
                                      ).values.first,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  getVehicleCondition(vehicle).keys.first,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Text(
                          vehicle.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Model: ${vehicle.model}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${vehicle.fuelEfficiency} km/l",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          getEfficiencyStatus(vehicle),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar headerParts() {
    return AppBar(
      backgroundColor: Color(0xffececee),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      centerTitle: true,
      title: Text(
        'Car model shop',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
