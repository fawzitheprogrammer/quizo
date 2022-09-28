import 'package:flutter/cupertino.dart';

double checkHeight(BuildContext context,screenPercent){
  return MediaQuery.of(context).size.height * screenPercent;
}

double checkWidth(BuildContext context,screenWidth){
  return MediaQuery.of(context).size.width * screenWidth;
}