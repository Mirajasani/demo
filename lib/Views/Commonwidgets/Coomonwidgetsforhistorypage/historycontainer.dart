import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/Appcolor.dart';

class historycontainer extends StatelessWidget {
  historycontainer({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.h,
      width: 20.w,
      decoration: BoxDecoration(
        color:Appcolor.Commonlightgreen,
        borderRadius: BorderRadius.circular(2.w),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
    );
  }
}