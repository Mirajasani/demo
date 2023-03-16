import 'package:demo/Utils/Appcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommonTextfieldfordiamondandprice extends StatelessWidget {
  const CommonTextfieldfordiamondandprice({
   this.TextEditingController,
    required this.hinttext, this.validator,
  });

  final TextEditingController;
  final String hinttext;
  final dynamic validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 60.w,
      decoration: BoxDecoration(
        border: Border.all(color:Appcolor.basicwhite,width:2),
        borderRadius: BorderRadius.circular(5.w),
        color:  Color(0xffc1cfc1),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color:Appcolor.Maintextcolor),
          // textAlignVertical: TextAlignVertical.center,
          controller: TextEditingController,
          cursorColor:Appcolor.basicwhite,
          validator: validator,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinttext,
              hintStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.basicwhite)),
        ),
      ),
    );
    // return Container(
  }
}
