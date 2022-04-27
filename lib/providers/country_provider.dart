import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:projectstructure/common/const.dart';
import 'package:projectstructure/models/country_model.dart';
import 'package:projectstructure/services/service_config.dart';
import 'package:projectstructure/utilities/helper.dart';

class CountryProvider extends ChangeNotifier {

  bool loading = false;
  CountryModel? countryData;
  String? errorlog = Const.note;

  Future<dynamic> getCountry(code) async {
    final network = await Helper.isInternetAvailable();
    if (network) {
      log("loading ... => network available");
      try {
        dynamic _resp = await ServiceConfig.getCountries(code);
        loading = true;
        notifyListeners();
        if (_resp != null) {
          log("loading .. => resp not empty :=--> $_resp");
          loading = true;
          notifyListeners();
          countryData = CountryModel.fromJson(_resp);
          if (countryData != null) {
            loading = false;
            notifyListeners();
          }
        } else {
          loading = false;
          errorlog = Const.warning;
          notifyListeners();
        }
      } catch (error) {
        loading = false;
        countryData = null;
        errorlog = Const.noSearchResult;
        notifyListeners();
      }
    } else {
      errorlog = Const.noInternet;
    }
  }
}
