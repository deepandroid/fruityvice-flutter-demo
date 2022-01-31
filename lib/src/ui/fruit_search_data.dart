import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruityvice/src/blocs/fruit_bloc.dart';
import 'package:fruityvice/src/models/iteam_model.dart';
import 'package:fruityvice/src/ui/fruit_detail.dart';
import 'package:fruityvice/src/util/app_constants.dart';
import 'package:fruityvice/src/util/color_constants.dart';
import 'package:fruityvice/src/util/dimensions.dart';
import 'package:fruityvice/src/util/images.dart';
import 'package:fruityvice/src/util/styles.dart';

class FruitSearchData extends StatefulWidget {
  const FruitSearchData({Key? key}) : super(key: key);

  @override
  _FruitSearchDataState createState() => _FruitSearchDataState();
}

class _FruitSearchDataState extends State<FruitSearchData> {
  TextEditingController searchDataController = TextEditingController();
  bool _isSearching = false, isGetResult = false;
  String _searchText = "";

  _FruitSearchDataState() {
    searchDataController.addListener(() {
      if (searchDataController.text.isEmpty) {
        setState(() {
          _isSearching = false;
          isGetResult = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          isGetResult = true;
          _searchText = searchDataController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.screenHeight / 40,
          ),
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextField(
              style: poppinsMedium,
              controller: searchDataController,
              onSubmitted: (text) {
                bloc.searchFruitDetails(text);
                _searchText = text;
               setState(() {
                 isGetResult = false;
               });
              },
              // onChanged: (text){
              //   bloc.searchFruitDetails(text);
              //   _searchText = text;
              //   isGetResult = false;
              // },
              //style: searchTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: Dimensions.screenWidth / 30,
                  top: Dimensions.screenHeight / 60,
                  bottom: Dimensions.screenHeight / 60,

                ),
                hintStyle: poppinsMedium,
                hintText: AppConstants.SEARCH_LABEL,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 24.0,
                  color: Colors.grey,
                ),
                suffixIcon: _isSearching
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            searchDataController.text = "";
                            bloc.searchFruitDetails("");
                          });
                        },
                        child: const Icon(
                          Icons.clear,
                          size: 20.0,
                          color: Colors.grey,
                        ))
                    : Container(
                        width: 1,
                      ),
              ),
            ),
          ),
          isGetResult
              ? Container(
                  height: Dimensions.screenHeight / 8,
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: displaySearchResults(),
                )
              : Container(),
          StreamBuilder(
            stream: bloc.searchFruitsData,
            builder: (context, AsyncSnapshot<ItemModel> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.name != null
                    ? Padding(
                        padding: EdgeInsets.only(
                          top: Dimensions.screenHeight / 40,
                          left: Dimensions.screenWidth / 40,
                          right: Dimensions.screenWidth / 40,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FruitDetail(
                                      index: snapshot.data,
                                    )));
                          },
                          child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.name.toString(),
                                      style: poppinsBold,
                                    ),
                                    SizedBox(
                                      height: Dimensions.screenHeight / 120,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "genus:",
                                          style: poppinsRegular.apply(
                                            color: Colors.black38,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimensions.screenWidth / 50,
                                        ),
                                        Text(
                                          snapshot.data!.genus.toString(),
                                          style: poppinsMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "family:",
                                          style: poppinsRegular.apply(
                                            color: Colors.black38,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimensions.screenWidth / 50,
                                        ),
                                        Text(
                                          snapshot.data!.family.toString(),
                                          style: poppinsMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "order:",
                                          style: poppinsRegular.apply(
                                            color: Colors.black38,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimensions.screenWidth / 50,
                                        ),
                                        Text(
                                          snapshot.data!.order.toString(),
                                          style: poppinsMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _isSearching
                              ? SizedBox(
                                  height: Dimensions.screenHeight / 10,
                                )
                              : SizedBox(
                                  height: Dimensions.screenHeight / 3,
                                ),
                          SvgPicture.asset(
                            Images.FRUIT_ITEM,
                            width: 22,
                            height: 22,
                            color: ColorConstants.blackColor,
                          ),
                          Text(
                            AppConstants.NO_FRUIT_FOUND,
                            style: poppinsRegular.apply(
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      );
              } else if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Dimensions.screenHeight / 10,
                    ),
                    SvgPicture.asset(
                      Images.FRUIT_ITEM,
                      width: 22,
                      height: 22,
                      color: ColorConstants.blackColor,
                    ),
                    Text(
                      AppConstants.NO_FRUIT_FOUND,
                      style: poppinsRegular.apply(
                        color: Colors.black87,
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }

  Widget displaySearchResults() {
    if (_isSearching) {
      return Align(alignment: Alignment.topCenter, child: searchList());
    } else {
      return Align(alignment: Alignment.topCenter, child: Container());
    }
  }

  ListView searchList() {
    List<String> results = _buildSearchList();
    return ListView.builder(
      itemCount: _buildSearchList().isEmpty == null ? 0 : results.length,
      itemBuilder: (context, int index) {
        return InkWell(
          onTap: () {
            setState(() {
              searchDataController.text = results.elementAt(index).toString();
              bloc.searchFruitDetails(searchDataController.text);
              isGetResult = false;
            });
          },
          child: Container(
            decoration: const BoxDecoration(
                color: ColorConstants.whiteColor,
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
            child: ListTile(
              title: Text(results.elementAt(index).toString(),
                  style: poppinsMedium),
            ),
          ),
        );
      },
    );
  }

  List<String> _buildSearchList() {
    if (_searchText.isEmpty) {
      return [];
    } else {
      List<String> _searchList = [];
      for (int i = 0; i < AppConstants.historyList.length; i++) {
        String result = AppConstants.historyList.elementAt(i);
        if ((result).toLowerCase().contains(_searchText.toLowerCase())) {
          if (_searchList.isNotEmpty) {
            for (int i = 0; i < _searchList.length; i++) {
              if (!_searchList.contains(result)) {
                _searchList.add(result);
              }
            }
          } else {
            _searchList.add(result);
          }
        }
      }
      return _searchList;
    }
  }
}
