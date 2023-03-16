import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget CoomonAppBar({required String title,required Color color,backgroundcolor}){
  return AppBar(
    backgroundColor:backgroundcolor,
    centerTitle: true,

    elevation: 0.0,
    title: Text(
      title,
      style: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.bold, color: color),
    ),
  );
}

