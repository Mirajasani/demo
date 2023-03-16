import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../Localozation_service.dart';
import '../../Utils/Appcolor.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String dropdownvalue = 'English';

  var items = [
    'English',
    'Hindi',
    'Gujarati',
  ];
  // onShareWithEmptyFields(BuildContext context) async {
  //   await Share.share("text");
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xfff0eadd),
        ),
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          DrawerHeader(
            decoration: BoxDecoration(
              color:Color(0xffc1cfc1),
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color:Color(0xffc1cfc1),),
              accountName: Text(
                "Abhishek Mishra",
                style: TextStyle(fontSize: 10.sp,color: Appcolor.Maintextcolor),
              ),
              accountEmail: Text("abhishekm977@gmail.com",  style: TextStyle(fontSize: 10.sp,color: Appcolor.Maintextcolor),),
            )),
          settingCommoncontainer(
              text: Text('Share App',style: TextStyle(fontSize: 10.sp,color: Appcolor.Maintextcolor),), icon: Icon(Icons.share), ontap: () {}),
          SizedBox(
            height: 1.h,
          ),
          settingCommoncontainer(
              text: Text('Rate App',style: TextStyle(fontSize: 10.sp,color: Appcolor.Maintextcolor),), icon: Icon(Icons.star_rate), ontap: () {}),

          SizedBox(
            height: 1.h,
          ),
          settingCommoncontainer(
              text: Text('Privacy Policy',style: TextStyle(fontSize: 10.sp,color: Appcolor.Maintextcolor),),
              icon: Icon(Icons.privacy_tip_outlined),
              ontap: () {}),

          SizedBox(
            height: 1.h,
          ),
          settingCommoncontainer(
              text: Text('More Apps',style: TextStyle(fontSize: 10.sp,color: Appcolor.Maintextcolor),),
              icon: Icon(Icons.grid_on_rounded),
              ontap: () {}),

          SizedBox(
            height: 1.h,
          ),
          settingCommoncontainer(
              text: Text('Feedback',style: TextStyle(fontSize: 10.sp,color: Appcolor.Maintextcolor),), icon: Icon(Icons.feedback), ontap: () {}),

          SizedBox(
            height: 1.h,
          ),
  settingCommoncontainer(text:Row(
    children: [
      Text("Language",style: TextStyle(fontSize: 10.sp,color: Appcolor.Maintextcolor),),
      SizedBox(width:12.w),
      DropdownButton(
        borderRadius: BorderRadius.circular(12),
        underline: Container(),
        value: dropdownvalue,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items,style: TextStyle(
                fontSize: 10.sp,
                color:Appcolor.Maintextcolor),),

          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
            LocalizationService().changeLocale(newValue);
          });
        },
      ),

    ],
  ),
      icon: Icon(Icons.language),
      ontap: (){})
          ],
      ),
     );
  }

  Padding settingCommoncontainer(

      {required Widget text, required Icon icon, required dynamic ontap}) {
    return
      Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListTile(
        leading: icon,
        title: text,
        onTap: ontap,
      ),
    );
  }
}
