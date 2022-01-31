import 'package:flutter/material.dart';
import 'package:fruityvice/src/models/iteam_model.dart';
import 'package:fruityvice/src/util/dimensions.dart';
import 'package:fruityvice/src/util/styles.dart';

class CardItemView extends StatefulWidget {
  ItemModel? index;

  CardItemView({Key? key, this.index}) : super(key: key);

  @override
  State<CardItemView> createState() => _CardItemViewState();
}

class _CardItemViewState extends State<CardItemView> {
  Nutritions? nutritions;
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    nutritions = widget.index?.nutritions;
    return Card(
      child: ExpansionPanelList(
        animationDuration: Duration(milliseconds: 500),
        elevation: 1,
        children: [
          ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.index!.name.toString(),
                      style: poppinsBold,
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight / 120,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Genus:",
                          style: poppinsRegular.apply(
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.screenWidth / 50,
                        ),
                        Text(
                          widget.index!.genus.toString(),
                          style: poppinsMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Family:",
                          style: poppinsRegular.apply(
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.screenWidth / 50,
                        ),
                        Text(
                          widget.index!.family.toString(),
                          style: poppinsMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order: ",
                          style: poppinsRegular.apply(
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.screenWidth / 50,
                        ),
                        Text(
                          widget.index!.order.toString(),
                          style: poppinsMedium,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            body: Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nutritions",
                      style: poppinsRegular.apply(
                        color: Colors.black,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: Dimensions.screenWidth / 3.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Carbohydrates:",
                                style: poppinsRegular.apply(
                                  fontSizeFactor: 0.8,
                                  color: Colors.black38,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.screenWidth / 50,
                              ),
                              Text(
                                nutritions!.carbohydrates.toString(),
                                style: poppinsMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: Dimensions.screenWidth / 3.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "protein:",
                                style: poppinsRegular.apply(
                                  color: Colors.black38,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.screenWidth / 50,
                              ),
                              Text(
                                nutritions!.protein.toString(),
                                style: poppinsMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: Dimensions.screenWidth / 3.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "fat:",
                                style: poppinsRegular.apply(
                                  color: Colors.black38,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.screenWidth / 50,
                              ),
                              Text(
                                nutritions!.fat.toString(),
                                style: poppinsMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: Dimensions.screenWidth / 3.5,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "calories:",
                                style: poppinsRegular.apply(
                                  color: Colors.black38,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.screenWidth / 50,
                              ),
                              Text(
                                nutritions!.calories.toString(),
                                style: poppinsMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.screenWidth / 70,
                      ),
                      Container(
                        width: Dimensions.screenWidth / 3.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "sugar:",
                                style: poppinsRegular.apply(
                                  color: Colors.black38,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.screenWidth / 50,
                              ),
                              Text(
                                nutritions!.sugar.toString(),
                                style: poppinsMedium,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            isExpanded: isExpand,
          )
        ],
        expansionCallback: (int item, bool status) {
          setState(() {
            isExpand = !isExpand;
          });
        },
      ),
    );
  }
}
