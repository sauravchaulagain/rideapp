import 'package:flutter/material.dart';
import 'package:ridesharing/app/text_style.dart';
import 'package:ridesharing/common/widget/common_container.dart';
import 'package:ridesharing/common/widget/common_list_tile.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
        appBarTitle: "History",
        body: Column(
          children: [
            ListView.builder(
              itemCount: 15,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => CustomListTile(
                title: "Nate",
                subtitle: "Mustang Shelby GT",
                trailing: Text(
                  "Today at 09:20 am",
                  style: PoppinsTextStyles.bodyMediumRegular
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                ),
                onTap: () {},
              ),
            )
          ],
        ));
  }
}
