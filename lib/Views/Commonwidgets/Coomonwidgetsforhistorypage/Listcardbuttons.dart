import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/Appcolor.dart';

class Listcardbuttons extends StatelessWidget {
  Listcardbuttons({required this.icon,  required this.ontap});
  final dynamic ontap;
  final Icon icon ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:4.h,width: 4.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:  Color(0xff282828),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          )
        ],
        color: Appcolor.basicwhite,
        borderRadius: BorderRadius.circular(4.w),
      ),
      child:IconButton(
          onPressed: ontap,
          icon: icon),
    );
  }
}