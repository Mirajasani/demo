import 'package:demo/Utils/Appcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class CommonRow extends StatelessWidget {
  CommonRow({required this.title, required this.value});
  final String title,value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text( title,style: TextStyle(fontSize:10.sp)),
        Text( value,style: TextStyle(fontSize:10.sp,fontWeight: FontWeight.bold,color: Appcolor.Maintextcolor),),
      ],
    );
  }
}