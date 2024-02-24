import 'package:flutter/material.dart';
import 'package:portfolioapp/common/constant/assets.dart';
import 'package:portfolioapp/common/widget/common_container.dart';
import 'package:portfolioapp/common/widget/common_gridview_container.dart';

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
