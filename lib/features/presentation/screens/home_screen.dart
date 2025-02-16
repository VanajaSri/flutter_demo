
// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/features/presentation/screens/vehicle_details.dart';
import 'package:flutter_demo/constants/optimized_image_loader.dart';
import 'package:flutter_demo/features/data/models/vehicle.dart';
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

  Future<bool> _onBackPressed() async {
    bool exitApp = await showModalBottomSheet<bool>(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Are you sure you want to exit?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          SystemNavigator.pop(); 
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Yes, Exit"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, false); 
                        },
                        child: const Text("No"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ) ??
        false; 

    return exitApp;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed, 
      child: Scaffold(
        backgroundColor: const Color(0xffececee),
        appBar: headerParts(),
        body: carList(context),
      ),
    );
  }

  SingleChildScrollView carList(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MasonryGridView(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            crossAxisSpacing: 25,
            mainAxisSpacing: 25,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
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
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: OptimizedImageLoader(
                                imagePath: vehicle.image,
                                width: vehicle.imageWidth,
                                height: vehicle.imageHeight,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: getVehicleCondition(vehicle).values.first,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  getVehicleCondition(vehicle).keys.first,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Text(
                          vehicle.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Model: ${vehicle.model}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${vehicle.fuelEfficiency} km/l",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          getEfficiencyStatus(vehicle),
                          style: const TextStyle(
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
      backgroundColor: const Color(0xffececee),
      leading: IconButton(
        onPressed: () {
          _onBackPressed(); 
        },
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      centerTitle: true,
      title: const Text(
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
