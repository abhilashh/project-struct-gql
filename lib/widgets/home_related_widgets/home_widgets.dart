
import 'package:flutter/material.dart';

class HomeWidgets{

 static Widget keyValueWiget(String key, String value) {
  return Center(
      child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 50),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$key  :",
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
        )
      ],
    ),
  ));
}
}




















// code :  may be used or not
// static Widget animatedSearchBar(
//     TextEditingController textController, dynamic onSuffixTap) {
//   return Padding(
//     padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
//     child: AnimSearchBar(
//         width: 400,
//         textController: textController,
//         suffixIcon: const Icon(Icons.search),
//         onSuffixTap: onSuffixTap),
//   );
// }


