import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

Future<bool> galleryPermissions() async {
  PermissionStatus result;
  if (Platform.isAndroid) {
    result = await Permission.storage.request();
  } else {
    result = await Permission.photos.request();
  }
  if (result.isGranted) {
    return true;
  } else {
    return false;
  }
}

_requestPerm() async {
  PermissionStatus result;
  if (Platform.isAndroid) {
    result = await Permission.storage.request();
  } else {
    result = await Permission.photos.request();
  }
}
