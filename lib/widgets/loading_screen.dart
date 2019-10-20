import 'package:flutter/material.dart';
import 'custom_text.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText("Chargement en cours ...", fontStyle:  FontStyle.italic, fontSize: 30.0,),
    );
  }
}
