import 'package:demo/Utils/AppString.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../Database/Sqfdatamodel.dart';
import '../../Database/sqfdatabase.dart';
import '../../Utils/Appcolor.dart';
import '../CommonforApp/AppBar.dart';
import '../Commonwidgets/Coomonwidgetsforhistorypage/CommonRow.dart';
import '../Commonwidgets/Coomonwidgetsforhistorypage/Listcardbuttons.dart';
import '../Commonwidgets/Coomonwidgetsforhistorypage/historycontainer.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final DbManager dbManager = new DbManager();
  late List<Model> modelList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: CoomonAppBar(
            title: 'History',
            color: Appcolor.Maintextcolor,
            backgroundcolor: Appcolor.Commonlightgreen),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Appcolor.backGroundcolor,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 1.w, right: 1.w, top: 5.w),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context as BuildContext).size.height / 20,
                width: MediaQuery.of(context as BuildContext).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: Appcolor.Maintextcolor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        DateFormat.YEAR_MONTH,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Appcolor.basicwhite),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 63.h,
                width: 100.w,
                child: FutureBuilder(
                  future: dbManager.getModelList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      modelList = snapshot.data!;
                      return ListView.builder(
                        itemCount: modelList.length,
                        itemBuilder: (context, index) {
                          Model model = modelList[index];
                          return Padding(
                            padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: Container(
                              height: 20.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: Appcolor.basicwhite),
                                borderRadius: BorderRadius.circular(2.w),
                                color: Appcolor.Commonlightgreen,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CommonRow(
                                            title: AppString.date,
                                            value: DateFormat.yMMMEd()
                                                .format(DateTime.now())),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Listcardbuttons(
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                  size: 15,
                                                ),
                                                ontap: () {
                                                  Model updatemodel = Model(
                                                      NumberofDiamond: model.NumberofDiamond,
                                                      Price: model.Price,
                                                      Category: model.Category,
                                                      Total: model.Total);
                                                  dbManager
                                                      .updateModel(updatemodel);
                                                },
                                              ),
                                              SizedBox(width: 3.w),
                                              Listcardbuttons(
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.black,
                                                  size: 15,
                                                ),
                                                ontap: () {
                                                  dbManager.deleteModel(model);
                                                },
                                              ),
                                              SizedBox(width: 3.w),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    CommonRow(
                                        title: AppString.TotalDiamond,
                                        value: model.NumberofDiamond),
                                    CommonRow(
                                        title: AppString.TotalRs,
                                        value: model.Price),
                                    CommonRow(
                                        title: AppString.Totalinwords,
                                        value:
                                            'two thoiusand and five hundred'),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3.0,
                                          right: 3.0,
                                          top: 8.0,
                                          bottom: 8.0),
                                      child: Container(
                                        height: 6.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          color: Appcolor.basicwhite,
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              historycontainer(
                                                text: model.Category,
                                              ),
                                              historycontainer(
                                                text: model.NumberofDiamond,
                                              ),
                                              historycontainer(
                                                  text: model.Price),
                                              historycontainer(
                                                  text: model.Total),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(height: 1.h),
              // Container(
              //   height: 6.h,
              //   width: 100.w,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text("Total Diamonds:${modelList[0].NumberofDiamond}",
              //           style: TextStyle(
              //               fontSize: 12.sp,
              //               fontWeight: FontWeight.bold,
              //               color: Appcolor.Maintextcolor)),
              //       SizedBox(height: 1.w),
              //       Text("Total Rs:${modelList[0].Price}",
              //           style: TextStyle(
              //               fontSize: 12.sp,
              //               fontWeight: FontWeight.bold,
              //               color: Appcolor.Maintextcolor)),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
