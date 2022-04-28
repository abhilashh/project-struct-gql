import 'dart:developer';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:projectstructure/Routes/nav_routes.dart';
import 'package:projectstructure/common/color_palette.dart';
import 'package:projectstructure/common/const.dart';
import 'package:projectstructure/providers/country_provider.dart';
import 'package:projectstructure/widgets/home_related_widgets/home_widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String apptitle;
  const Home({Key? key, this.apptitle = ""}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController(text: "");
    final dataFromServer = Provider.of<CountryProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: ColorPalette.pureWhite,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
              child: AnimSearchBar(
                width: 400,
                textController: textController,
                suffixIcon: const Icon(Icons.search),
                closeSearchOnSuffixTap: true,
                onSuffixTap: () {
                  setState(() {
                  log(textController.text);
                  dataFromServer.getCountry(textController.text);
                  textController.clear();
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<CountryProvider>(builder: ((context, value, child) {
              return value.loading
                  ? const Center(child: CircularProgressIndicator())
                  : value.countryData != null
                      ? Column(
                          children: [
                            HomeWidgets.keyValueWiget(Const.name,value.countryData!.country!.name!.toString()),
                            HomeWidgets.keyValueWiget(Const.native,value.countryData!.country!.native!.toString()),
                            HomeWidgets.keyValueWiget(Const.capital,value.countryData!.country!.capital!.toString()), 
                             const SizedBox(height: 20,),
                            ElevatedButton(onPressed: ()=>NavRoute.navToView(context), child:const Text(Const.buttonText))
                          ],
                        )
                      : Text(value.errorlog.toString(),textAlign: TextAlign.center,);
            }))
          ],
        ));
  }
}
