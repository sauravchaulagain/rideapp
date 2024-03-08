import 'package:flutter/material.dart';
import 'package:ridesharing/common/widget/common_container.dart';
import 'package:ridesharing/feature/rideFlow/availableRide/avaliable_ride_design.dart';

class AvailableRideWidget extends StatelessWidget {
  const AvailableRideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
        appBarTitle: "Avaliable Ride",
        body: Column(
          children: [
            ListView.builder(
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => const AvailableRideBoxDesign(),
            ),
          ],
        ));
  }
}
