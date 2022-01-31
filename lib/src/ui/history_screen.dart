import 'package:flutter/material.dart';
import 'package:fruityvice/src/util/app_constants.dart';
import 'package:fruityvice/src/util/color_constants.dart';
import 'package:fruityvice/src/util/dimensions.dart';
import 'package:fruityvice/src/util/styles.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "History",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    AppConstants.historyList = [];
                  });
                },
                child: const Text(
                  "clear",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: AppConstants.historyList.isEmpty
            ? Center(
                child: Text(
                  AppConstants.NO_RECORD,
                  style: poppinsRegular.apply(
                    color: Colors.black87,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: AppConstants.historyList.length,
                itemBuilder: (context, int index) {
                  return Container(
                    color: ColorConstants.whiteColor,
                    height: 40,
                    width: Dimensions.screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "" + AppConstants.historyList[index].toString(),
                        style: poppinsMedium,
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
