import 'package:flutter/material.dart';
import 'package:projectstructure/common/color_palette.dart';
import 'package:projectstructure/common/const.dart';
import 'package:projectstructure/providers/country_provider.dart';
import 'package:projectstructure/widgets/home_related_widgets/home_widgets.dart';
import 'package:provider/provider.dart';

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.pureWhite,
        appBar: AppBar(
            backgroundColor: ColorPalette.pureWhite,
            foregroundColor: ColorPalette.pureBlack,
            elevation: 0,
            automaticallyImplyLeading: true),
        body: Consumer<CountryProvider>(builder: ((context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeWidgets.keyValueWiget(
                  Const.name, value.countryData!.country!.name!.toString()),
              HomeWidgets.keyValueWiget(
                  Const.native, value.countryData!.country!.native!.toString()),
              HomeWidgets.keyValueWiget(Const.capital,
                  value.countryData!.country!.capital!.toString()),
              HomeWidgets.keyValueWiget(
                  Const.emoji, value.countryData!.country!.emoji!.toString()),
              HomeWidgets.keyValueWiget(Const.currency,
                  value.countryData!.country!.currency!.toString()),
            ],
          );
        })));
  }
}
