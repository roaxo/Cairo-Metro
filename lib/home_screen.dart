import 'package:cairo_metro/custom_dropdown.dart';
import 'package:cairo_metro/custom_feild.dart';
import 'package:cairo_metro/logic.dart';
import 'package:cairo_metro/route.dart';
import 'package:cairo_metro/trip_details';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  final startStation = TextEditingController();
  final endStation = TextEditingController();
  final destController = TextEditingController();
  var stationsNum = 0.obs;
  var tripTime = 0.obs;
  var price = 0.obs;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cairo Metro', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 29, 80, 104),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          hintText: "Starting station",
                          controller: startStation,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.pin_drop_rounded),
                        iconSize: 30,
                        color: const Color.fromARGB(255, 29, 80, 104),
                        onPressed: () async {
                          if (startStation.text.isEmpty) {
                            Get.snackbar(
                              "Error",
                              "Please select start station",
                              backgroundColor: Colors.grey.withOpacity(0.5),
                            );
                            return;
                          }
                          var coords = stationCoordinates[startStation.text];
                          if (coords == null) {
                            Get.snackbar(
                              "Error",
                              "No Coordinates to this staiton",
                              backgroundColor: Colors.grey.withOpacity(
                                0.5,
                              ), // semi-transparent
                            );
                            return;
                          }
                          final url = Uri.parse(
                            'geo:${coords['lat']},${coords['lng']}?q=${coords['lat']},${coords['lng']}(${startStation.text})',
                          );
                          await launchUrl(url);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.my_location),
                        iconSize: 30,
                        color: const Color.fromARGB(255, 29, 80, 104),
                        onPressed: () async {
                          var closest = await getClosestStation();
                          if (closest != null) {
                            startStation.text = closest['station'];
                            Get.snackbar(
                              'Distance',
                              "${(closest['distance'] / 1000).toStringAsFixed(2)} km away",
                              backgroundColor: Colors.grey.withOpacity(0.5),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  CustomDropdown(
                    hintText: "End Station",
                    controller: endStation,
                  ),

                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (startStation.text.isEmpty ||
                              endStation.text.isEmpty) {
                            Get.snackbar(
                              "Error",
                              "Please select both stations",
                              backgroundColor: Colors.grey.withOpacity(0.5),
                            );
                            return;
                          }

                          if (startStation.text == endStation.text) {
                            Get.snackbar(
                              "Error",
                              "Please select different stations",
                              backgroundColor: Colors.grey.withOpacity(0.5),
                            );
                            return;
                          }

                          var route = findShortestPath(
                            startStation.text,
                            endStation.text,
                          );

                          stationsNum.value = route.length;
                          tripTime.value = stationsNum.value * 2;

                          if (stationsNum.value <= 9) {
                            price.value = 8;
                          } else if (stationsNum.value <= 16) {
                            price.value = 10;
                          } else if (stationsNum.value <= 23) {
                            price.value = 15;
                          } else {
                            price.value = 20;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            29,
                            80,
                            104,
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          "Trip Details",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      //show route
                      ElevatedButton(
                        onPressed: () {
                          if (startStation.text.isEmpty ||
                              endStation.text.isEmpty) {
                            Get.snackbar(
                              "Error",
                              "Please select both stations",
                              backgroundColor: Colors.grey.withOpacity(0.5),
                            );
                            return;
                          }

                          if (startStation.text == endStation.text) {
                            Get.snackbar(
                              "Error",
                              "Please select different stations",
                              backgroundColor: Colors.grey.withOpacity(0.5),
                            );
                            return;
                          }

                          var route = findShortestPath(
                            startStation.text,
                            endStation.text,
                          );

                          Get.to(RouteScreen(route: route));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            29,
                            80,
                            104,
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          "Route",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  Obx(() {
                    if (stationsNum.value == 0) return SizedBox.shrink();

                    return TripSummary(
                      stations: stationsNum.value,
                      time: tripTime.value,
                      price: price.value,
                    );
                  }),

                  SizedBox(height: 26),

                  CustomTextField(
                    label: "Enter Destination",
                    controller: destController,
                    icon: Icons.bus_alert_rounded,
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      if (destController.text.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Please enter destination",
                          backgroundColor: Colors.grey.withOpacity(0.5),
                        );
                        return;
                      }

                      var closestStationFromAddress =
                          await getClosestStationFromAdd(destController.text);

                      if (closestStationFromAddress == null ||
                          closestStationFromAddress["station"] == null) {
                        Get.snackbar(
                          "Error",
                          "Could not find a nearby station",
                          backgroundColor: Colors.grey.withOpacity(0.5),
                        );
                        return;
                      }

                      endStation.text = closestStationFromAddress["station"]!;
                      Get.snackbar(
                        'Distance',
                        "${(closestStationFromAddress['distance']! / 1000).toStringAsFixed(2)} km away",
                        backgroundColor: Colors.grey.withOpacity(0.5),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 29, 80, 104),
                      elevation: 5,
                    ),
                    child: Text(
                      "Nearest Station",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
