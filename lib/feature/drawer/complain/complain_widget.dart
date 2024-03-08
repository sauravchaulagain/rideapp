import 'package:flutter/material.dart';
import 'package:ridesharing/common/constant/assets.dart';
import 'package:ridesharing/common/widget/common_container.dart';
import 'package:ridesharing/common/widget/common_dropdown_box.dart';
import 'package:ridesharing/common/widget/common_popup_box.dart';
import 'package:ridesharing/common/widget/custom_text_field.dart';
import 'package:ridesharing/common/widget/form_validator.dart';
import 'package:ridesharing/feature/dashboard/dashboard_widget.dart';

class ComplainWidget extends StatefulWidget {
  const ComplainWidget({super.key});

  @override
  State<ComplainWidget> createState() => _ComplainWidgetState();
}

class _ComplainWidgetState extends State<ComplainWidget> {
  final topicController = TextEditingController();
  final complainController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CommonContainer(
          buttonName: "Proceed",
          appBarTitle: "Complain",
          onButtonPressed: () {
            if (_formKey.currentState!.validate()) {
              showCommonPopUpDialog(
                  context: context,
                  message: "Your complain has been send successful",
                  title: "Send successful",
                  onEnablePressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardWidget(),
                      ),
                    );
                  },
                  imageUrl: Assets.successAlertImage,
                  enableButtonName: "Done");
            }
          },
          body: Column(
            children: [
              ReusableTextField(
                suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                controller: topicController,
                hintText: "Topic",
                readOnly: true,
                validator: (p0) {
                  if (p0 == null) {
                    return "Please select you category";
                  }
                  return null;
                },
                onTap: () {
                  showPopUpMenuWithItems(
                    context: context,
                    title: "Select",
                    onItemPressed: (p0) {
                      topicController.text = p0;
                      setState(() {});
                    },
                    dataItems: topicList,
                  );
                },
              ),
              ReusableTextField(
                controller: complainController,
                validator: (p0) =>
                    FormValidator.validateFieldNotEmpty(p0, "This Field"),
                // maxLines: 4,
                textInputType: TextInputType.multiline,
                hintText: "Write your complain here (minimum 10 characters)",
              )
            ],
          )),
    );
  }

  final List<String> topicList = [
    'Late Arrival',
    'Poor Navigation',
    'Vehicle Condition',
    'Driver Behavior',
    'Fare Dispute',
    'Safety Concerns',
    'App Malfunction',
    'Billing Issue',
  ];
}
