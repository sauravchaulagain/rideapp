import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ridesharing/common/utils/snackbar_utils.dart';

class PermissionUtils {
  static Future<bool> requestCameraPermission(BuildContext context) async {
    final status = await Permission.camera.request();
    if (status.isGranted || status.isLimited) {
      SnackBarUtils.showSuccessBar(
          context: context, message: 'Camera permission granted!');
      return true;
    } else {
      SnackBarUtils.showErrorBar(
          context: context, message: 'Camera permission denied!');
      return false;
    }
  }

  static Future<bool> requestNotificationPermission(
      BuildContext context) async {
    final status = await Permission.notification.request();
    if (status.isGranted || status.isLimited) {
      SnackBarUtils.showSuccessBar(
          context: context, message: 'Notification permission granted!');
      return true;
    } else {
      SnackBarUtils.showErrorBar(
          context: context, message: 'Notification permission denied!');
      return false;
    }
  }

  static Future<bool> requestLocationPermission(BuildContext context) async {
    final status = await Permission.location.request();
    if (status.isGranted || status.isLimited) {
      SnackBarUtils.showSuccessBar(
          context: context, message: 'Location permission granted!');
      return true;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    } else {
      SnackBarUtils.showErrorBar(
          context: context, message: 'Location permission denied!');
      return false;
    }
  }
}
