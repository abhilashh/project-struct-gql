import 'dart:io';

import 'package:projectstructure/common/const.dart';
import 'package:projectstructure/utilities/toast.dart';

class Helper{

  //internet availability check func.
    static Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup(Const.checkDomain);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
      ToastMessage.showToast(Const.noInternet);
        return false;
      }
    } on SocketException catch (_) {
      ToastMessage.showToast(Const.noInternet);
      return false;
    }
  }
  
} 