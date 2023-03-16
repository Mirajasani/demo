
import 'package:demo/Utils/AppString.dart';
import 'package:demo/Utils/Appcolor.dart';
import 'package:demo/Views/CommonforApp/AppBar.dart';
import 'package:demo/Views/CommonforApp/CommonTextfieldforhomescreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../Database/Sqfdatamodel.dart';
import '../../Database/sqfdatabase.dart';
import 'Drawer.dart';

class NewHomeWidget extends StatefulWidget {
  const NewHomeWidget({Key? key}) : super(key: key);

  @override
  State<NewHomeWidget> createState() => _NewHomeWidgetState();
}

class _NewHomeWidgetState extends State<NewHomeWidget> {
  final DbManager dbManager = new DbManager();
  late Model model;
  String dropdownvalue = 'Category A';
  DateTime currentDate = DateTime.now();
  TextEditingController numberofdiamoncontroller = TextEditingController();
  TextEditingController Pricecontroller= TextEditingController();
  String total='';
  var items = [
    'Category A',
    'Category B',
    'Category C',
    'Category D',
  ];
  String finalDate = '';
  void calculation() {
    setState(() {
      int multiply = int.parse(numberofdiamoncontroller.text) * int.parse(Pricecontroller.text);
      total = multiply.toString();
    });
  }
  // getCurrentDate(){
  //   var date = new DateTime.now().subtract(Duration(days:1)).toString();
  //   var dateParse = DateTime.parse(date);
  //   var formattedDate = "${dateParse.day}/${dateParse.month}/${dateParse.year}";
  //   setState(() {
  //      finalDate = formattedDate.toString() ;
  //   });
  //
  // }
  Future<void> SelectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SettingScreen(),
      ),
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(80),
        child: CoomonAppBar(
          title: AppString.title,
          color:Appcolor.Maintextcolor,
          // leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
          backgroundcolor:Appcolor.Commonlightgreen,),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color:Appcolor.backGroundcolor,
        ),
        child: SingleChildScrollView(child:
        Padding(
          padding:EdgeInsets.only(left:12.0,right: 8.0),
          child: Column(
            children: [
              SizedBox(height:3.h),
              Container(
                height: MediaQuery.of(context).size.height/20,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color:Appcolor.Maintextcolor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        SelectDate(context);
                      },
                      child: Text(
                        DateFormat.yMMMEd().format( currentDate),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Appcolor.basicwhite),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:2.h,),
              Container(
                height:28.h,
                width: 100.w,
                // color: Colors.green,
                child: Column(
                  children: [
                    SizedBox(height:4.w,),
                    Row(
                      children: [
                        // SizedBox(width:4.w,),
                        Text('Diamond:',style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold,color:Appcolor.Maintextcolor),),
                        SizedBox(width:4.w,),
                        CommonTextfieldfordiamondandprice(hinttext:'Number of Diamond',TextEditingController: numberofdiamoncontroller),
                      ],
                    ),
                    SizedBox(height:4.w,),
                    Row(
                      children: [
                        // SizedBox(width:4.w,),
                        Text('Price:',style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold,color:Appcolor.Maintextcolor),),
                        SizedBox(width:11.w,),
                        CommonTextfieldfordiamondandprice(hinttext:'Cost of Diamond',TextEditingController: Pricecontroller),
                      ],
                    ),
                    SizedBox(height:4.w,),
                    Row(
                      children: [
                        // SizedBox(width:4.w,),
                        Text('Type:',style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold,color:Appcolor.Maintextcolor),),
                        SizedBox(width:11.w,),
                        Container(
                          height: 6.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            border: Border.all(color:Appcolor.basicwhite,width:2),
                            borderRadius: BorderRadius.circular(5.w),
                            color:Appcolor.Commonlightgreen,
                          ),
                          child: Center(
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(12),
                              underline: Container(),
                              value: dropdownvalue,style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Appcolor.basicwhite),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items,style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Appcolor.Maintextcolor),),

                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                  newValue='';

                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(  height:5.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        color: Appcolor.basicwhite,
                        borderRadius: BorderRadius.circular(2.w),
                        border:
                        Border.all(color: Appcolor.basicwhite, width: 1)),
                    child: Center(child: Text(numberofdiamoncontroller.text.toString(),style: TextStyle(fontSize: 10.sp,
                        fontWeight: FontWeight.bold,color:Appcolor.Maintextcolor),)),
                  ),
                  Container(  height:5.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        color: Appcolor.basicwhite,
                        borderRadius: BorderRadius.circular(2.w),
                        border:
                        Border.all(color: Appcolor.basicwhite, width: 1)),
                    child: Center(child: Text(Pricecontroller.text.toString(),style: TextStyle(fontSize: 10.sp,
                        fontWeight: FontWeight.bold,color:Appcolor.Maintextcolor),)),
                  ),
                  Container(  height:5.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        color: Appcolor.basicwhite,
                        borderRadius: BorderRadius.circular(2.w),
                        border:
                        Border.all(color: Appcolor.basicwhite, width: 1)),
                    child: Center(child: Text(total.toString())),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap:  calculation,
                    child: Container(height:5.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: Appcolor.Maintextcolor,
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      child: Center(child:Text(AppString.Buttontextcalculate,style: TextStyle(fontSize: 12.sp,color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      numberofdiamoncontroller.clear();
                      Pricecontroller.clear();
                    },
                    child: Container(  height:5.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: Appcolor.Maintextcolor,
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      child: Center(child: Text(AppString.Buttontextreset,style: TextStyle(fontSize: 12.sp,color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ],
              ),
              SizedBox(height:3.h),
              Text('Total:${total.toString()}',style: TextStyle(fontSize:18.sp,
                  fontWeight: FontWeight.bold,color:Appcolor.Maintextcolor)),
              SizedBox(height:3.h),
              InkWell(
                onTap:(){
                  Model model = new Model(
                    NumberofDiamond:numberofdiamoncontroller.text, Price: Pricecontroller.text,
                    Category: dropdownvalue,Total:total
                  );
                  dbManager.insertModel(model);
                  print(model);
                },
                child: Container(  height:5.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                      color: Appcolor.Commonlightgreen,
                      borderRadius: BorderRadius.circular(2.w),
                      border: Border.all(color:Appcolor.Maintextcolor,width: 3.0)
                  ),
                  child: Center(child: Text(AppString.Buttontextsave,style: TextStyle(fontSize: 12.sp,color:Appcolor.Maintextcolor,fontWeight: FontWeight.bold),)),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}


//this is using getx///
// import 'package:demo/Utils/AppString.dart';
// import 'package:demo/Utils/Appcolor.dart';
// import 'package:demo/Views/CommonforApp/AppBar.dart';
// import 'package:demo/Views/CommonforApp/CommonTextfieldforhomescreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import 'package:intl/intl.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../controller/savedcontroller.dart';
// import 'Drawer.dart';
//
// class NewHomeWidget extends GetView<SaveController> {
//   final storeController = Get.put(SaveController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: SettingScreen(),
//       ),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(80),
//         child: CoomonAppBar(
//           title: AppString.title,
//           color: Appcolor.Maintextcolor,
//           backgroundcolor: AppColor. Commonlightgreen,
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           color: Appcolor.backGroundcolor,
//         ),
//         child: SingleChildScrollView(
//             child: Padding(
//           padding: EdgeInsets.only(left: 12.0, right: 8.0),
//           child: Column(
//             children: [
//               SizedBox(height: 3.h),
//               Container(
//                 height: MediaQuery.of(context).size.height / 20,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5.w),
//                   color: Appcolor.Maintextcolor,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         controller.SelectDate(context);
//                       },
//                       child: Text(
//                         DateFormat.yMMMEd().format(controller.currentDate),
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Appcolor.basicwhite),
//                       ),
//                     ),
//                                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//               Container(
//                 height: 28.h,
//                 width: 100.w,
//                 // color: Colors.green,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 4.w,
//                     ),
//                     Row(
//                       children: [
//                         // SizedBox(width:4.w,),
//                         Text(
//                           'Diamond:',
//                           style: TextStyle(
//                               fontSize: 13.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Appcolor.Maintextcolor),
//                         ),
//                         SizedBox(
//                           width: 4.w,
//                         ),
//                         CommonTextfieldfordiamondandprice(
//                             hinttext: 'Number of Diamond',
//                             TextEditingController:
//                                 controller.numberofdiamoncontroller),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 4.w,
//                     ),
//                     Row(
//                       children: [
//                         // SizedBox(width:4.w,),
//                         Text(
//                           'Price:',
//                           style: TextStyle(
//                               fontSize: 13.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Appcolor.Maintextcolor),
//                         ),
//                         SizedBox(
//                           width: 11.w,
//                         ),
//                         CommonTextfieldfordiamondandprice(
//                             hinttext: 'Cost of Diamond',
//                             TextEditingController: controller.Pricecontroller),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 4.w,
//                     ),
//                     Row(
//                       children: [
//                         // SizedBox(width:4.w,),
//                         Text(
//                           'Type:',
//                           style: TextStyle(
//                               fontSize: 13.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Appcolor.Maintextcolor),
//                         ),
//                         SizedBox(
//                           width: 11.w,
//                         ),
//                         Container(
//                           height: 6.h,
//                           width: 60.w,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: Appcolor.basicwhite, width: 2),
//                             borderRadius: BorderRadius.circular(5.w),
//                             color: AppColor. Commonlightgreen,
//                           ),
//                           child: Center(
//                             child: DropdownButton(
//                               onChanged: controller.Dropdownonchange,
//                               borderRadius: BorderRadius.circular(12),
//                               underline: Container(),
//                               value: controller.dropdownvalue,
//                               style: TextStyle(
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.bold,
//                                   color: Appcolor.basicwhite),
//                               items: controller.items.map((String items) {
//                                 return DropdownMenuItem(
//                                   value: items,
//                                   child: Text(
//                                     controller.dropdownvalue,
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Appcolor.Maintextcolor),
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     height: 5.h,
//                     width: 30.w,
//                     decoration: BoxDecoration(
//                         color: Appcolor.basicwhite,
//                         borderRadius: BorderRadius.circular(2.w),
//                         border:
//                             Border.all(color: Appcolor.basicwhite, width: 1)),
//                     child: Center(
//                         child: Text(
//                       controller.numberofdiamoncontroller.text.toString(),
//                       style: TextStyle(
//                           fontSize: 10.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Appcolor.Maintextcolor),
//                     )),
//                   ),
//                   Container(
//                     height: 5.h,
//                     width: 30.w,
//                     decoration: BoxDecoration(
//                         color: Appcolor.basicwhite,
//                         borderRadius: BorderRadius.circular(2.w),
//                         border:
//                             Border.all(color: Appcolor.basicwhite, width: 1)),
//                     child: Center(
//                         child: Text(
//                       controller.Pricecontroller.text.toString(),
//                       style: TextStyle(
//                           fontSize: 10.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Appcolor.Maintextcolor),
//                     )),
//                   ),
//                   Container(
//                     height: 5.h,
//                     width: 30.w,
//                     decoration: BoxDecoration(
//                         color: Appcolor.basicwhite,
//                         borderRadius: BorderRadius.circular(2.w),
//                         border:
//                             Border.all(color: Appcolor.basicwhite, width: 1)),
//                     child: Center(child: Text(controller.total.toString())),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 3.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   InkWell(
//                     onTap: controller.calculation,
//                     child: Container(
//                       height: 5.h,
//                       width: 45.w,
//                       decoration: BoxDecoration(
//                         color: Appcolor.Maintextcolor,
//                         borderRadius: BorderRadius.circular(2.w),
//                       ),
//                       child: Center(
//                           child: Text(
//                         AppString.Buttontextcalculate,
//                         style: TextStyle(
//                             fontSize: 12.sp,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       )),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       controller.numberofdiamoncontroller.clear();
//                       controller.Pricecontroller.clear();
//                     },
//                     child: Container(
//                       height: 5.h,
//                       width: 45.w,
//                       decoration: BoxDecoration(
//                         color: Appcolor.Maintextcolor,
//                         borderRadius: BorderRadius.circular(2.w),
//                       ),
//                       child: Center(
//                           child: Text(
//                         AppString.Buttontextreset,
//                         style: TextStyle(
//                             fontSize: 12.sp,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       )),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 3.h),
//               Text('Total:${controller.total.toString()}',
//                   style: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold,
//                       color: Appcolor.Maintextcolor)),
//               SizedBox(height: 3.h),
//               InkWell(
//                 onTap: () {
//                   controller.numberofdiamoncontroller.clear();
//                   controller.Pricecontroller.clear();
//                 },
//                 child: Container(
//                   height: 5.h,
//                   width: 45.w,
//                   decoration: BoxDecoration(
//                       color: AppColor. Commonlightgreen,
//                       borderRadius: BorderRadius.circular(2.w),
//                       border: Border.all(
//                           color: Appcolor.Maintextcolor, width: 3.0)),
//                   child: Center(
//                       child: Text(
//                     AppString.Buttontextsave,
//                     style: TextStyle(
//                         fontSize: 12.sp,
//                         color: Appcolor.Maintextcolor,
//                         fontWeight: FontWeight.bold),
//                   )),
//                 ),
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }
