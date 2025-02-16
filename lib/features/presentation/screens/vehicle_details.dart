import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/optimized_image_loader.dart';
import 'package:flutter_demo/features/data/models/vehicle.dart';

class VehicleDetails extends StatefulWidget {
  final Vehicle vehicle;
  const VehicleDetails({super.key, required this.vehicle});

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    final double imageHeight = screenHeight * 0.45;
    final double horizontalPadding = screenWidth * 0.1;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: imageHeight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      onPageChanged:
                          (value) => setState(() {
                            currentIndex = value;
                          }),
                      itemBuilder:
                          (context, index) => ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: OptimizedImageLoader(
                              imagePath: widget.vehicle.image,
                              width: screenWidth * 0.9,
                              height: imageHeight,
                              fit: BoxFit.cover,
                            ),
                          ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: imageHeight * 0.05,
                  right: screenWidth * 0.25,
                  child: Column(
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(bottom: 5),
                        width: screenWidth * 0.02,
                        height:
                            index == currentIndex
                                ? screenHeight * 0.025
                                : screenWidth * 0.02,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              index == currentIndex
                                  ? Colors.black45
                                  : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                widget.vehicle.name,
                style: TextStyle(
                  fontSize: screenWidth * 0.075,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "A reliable vehicle with excellent performance and comfort features",
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: screenWidth * 0.08,
                right: screenWidth * 0.08,
                top: screenHeight * 0.02,
              ),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(screenWidth * 0.1),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: vehicleInfo(
                          context,
                          Icons.local_gas_station,
                          'Efficiency',
                          '${widget.vehicle.fuelEfficiency} km/l',
                        ),
                      ),
                      Expanded(
                        child: vehicleInfo(
                          context,
                          Icons.calendar_today,
                          'Model',
                          widget.vehicle.model,
                        ),
                      ),
                      Expanded(
                        child: vehicleInfo(
                          context,
                          Icons.access_time,
                          'Age',
                          '${widget.vehicle.age} years',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 4,
                        child: Column(
                          children: [
                            Text(
                              'Vehicle Details',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                widget.vehicle.name,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Flexible(
                        flex: 6,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.08,
                            vertical: screenHeight * 0.02,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.055,
                            ),
                          ),
                          child: Text(
                            'Contact Dealer',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget vehicleInfo(
    BuildContext context,
    IconData icon,
    String name,
    String value,
  ) {
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: screenSize.width * 0.08, color: Colors.white),
        SizedBox(height: screenSize.height * 0.005),
        Text(
          name,
          style: TextStyle(
            fontSize: screenSize.width * 0.035,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: screenSize.width * 0.03,
            color: Colors.grey.shade200,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
