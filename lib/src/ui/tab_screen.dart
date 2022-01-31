import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruityvice/src/ui/history_screen.dart';
import 'package:fruityvice/src/util/app_constants.dart';
import 'package:fruityvice/src/util/color_constants.dart';
import 'package:fruityvice/src/util/dimensions.dart';
import 'package:fruityvice/src/util/images.dart';
import 'package:fruityvice/src/util/styles.dart';

import 'fruit_list.dart';
import 'fruit_search_data.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<dynamic, dynamic>>? _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const FruitSearchData(),
        'title': AppConstants.SEARCH,
      },
      {
        'page': const FruitListData(),
        'title': AppConstants.LOAD_DATA,
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.screenWidth = MediaQuery.of(context).size.width;
    Dimensions.screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          _pages![_selectedPageIndex]['title'],
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        actions: [
          _pages![_selectedPageIndex]['title'].toString() == AppConstants.SEARCH
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HistoryScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 18),
                    child: Icon(
                      Icons.history,
                      size: 30,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      body: _pages![_selectedPageIndex]['page'],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            color: Colors.white),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: BottomNavyBar(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            selectedIndex: _selectedPageIndex,
            onItemSelected: _selectPage,
            items: [
              BottomNavyBarItem(
                icon: const Icon(Icons.search),
                title: Text(
                  AppConstants.SEARCH,
                  style: poppinsMedium,
                ),
                activeColor: Colors.grey.shade900,
                inactiveColor: ColorConstants.blackColor,
              ),
              BottomNavyBarItem(
                icon: SvgPicture.asset(
                  Images.FRUIT_ITEM,
                  width: 22,
                  height: 22,
                  color: ColorConstants.blackColor,
                ),
                title: Text(
                  AppConstants.LOAD_DATA,
                  style: poppinsMedium,
                ),
                activeColor: Colors.grey.shade900,
                inactiveColor: ColorConstants.blackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
