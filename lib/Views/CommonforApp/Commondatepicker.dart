// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:path/path.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../Utils/Appcolor.dart';
//
// Container DateContainer({required String currentdate,required dynamic ontap}) {
//   return Container(
//     height: MediaQuery.of(context as BuildContext).size.height/20,
//     width: MediaQuery.of(context as BuildContext).size.width ,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(5.w),
//       color:Appcolor.Maintextcolor,
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         InkWell(
//           onTap: ontap,
//           child: Text(
//             DateFormat.yMMMEd().format( currentDate),
//             style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Appcolor.basicwhite),
//           ),
//         ),
//
//       ],
//     ),
//   );