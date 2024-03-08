import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ridesharing/common/constant/assets.dart';
import 'package:ridesharing/common/utils/permission_utils.dart';
import 'package:ridesharing/common/widget/page_wrapper.dart';
import 'package:ridesharing/feature/auth/welcomeScreen/screen/welcome_page.dart';

import '../../common/widget/common_popup_box.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  bool _locationStatus = false;

  @override
  void initState() {
    super.initState();
    _checkLocationPermissionStatus(context);
  }

  Future<void> _checkLocationPermissionStatus(BuildContext context) async {
    _locationStatus = await Permission.location.isGranted;
    if (_locationStatus) {
      _navigateToWelcomePage();
    }
  }

  void _navigateToWelcomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      padding: EdgeInsets.zero,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(Assets.mapImage),
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.srcATop,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PopUpDialogWidget(
              title: "Enable your location",
              description:
                  "Choose your location to start finding requests around you.",
              disableButtonName: "",
              onDisablePressed: () {},
              onEnablePressed: () async {
                await _requestLocationPermission();
              },
              enableButtonName: "Enable",
              imageUrl: Assets.locationImage,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _requestLocationPermission() async {
    bool status = await PermissionUtils.requestLocationPermission(context);
  }
}
