import 'package:flutter/material.dart';
import 'package:ridesharing/common/constant/assets.dart';
import 'package:ridesharing/common/widget/common_container.dart';
import 'package:ridesharing/common/widget/common_gridview_container.dart';
import 'package:ridesharing/feature/rideFlow/availableRide/available_ride_widget.dart';

class SelectTransportWidget extends StatelessWidget {
  SelectTransportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
        appBarTitle: "Select transport",
        body: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return CommonGridViewContainer(
                onContainerPress: () {
                  print("hello");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AvailableRideWidget(),
                    ),
                  );
                },
                imageUrl: dataList[index]["image"],
                title: dataList[index]["title"]);
          },
        ));
  }

  final List<Map<String, dynamic>> dataList = [
    {"image": Assets.carImage, "title": "Car"},
    {"image": Assets.bikeImage, "title": "Bike"},
    {"image": Assets.cycleImage, "title": "Cycle"},
    {"image": Assets.taxiImage, "title": "Taxi"},
  ];
}
