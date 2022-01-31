import 'package:flutter/material.dart';
import 'package:fruityvice/src/models/iteam_model.dart';
import 'package:fruityvice/src/util/dimensions.dart';
import 'package:fruityvice/src/util/styles.dart';

class FruitDetail extends StatelessWidget {
  ItemModel? index;

  FruitDetail({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Fruit Details",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.screenWidth / 40),
        child: Container(
          height: Dimensions.screenHeight /2.5,
          child: Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.screenWidth / 40,
                    right: Dimensions.screenWidth / 40,
                    top: Dimensions.screenHeight / 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      index!.name.toString(),
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
                          index!.genus.toString(),
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
                          index!.family.toString(),
                          style: poppinsMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order:",
                          style: poppinsRegular.apply(
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.screenWidth / 50,
                        ),
                        Text(
                          index!.order.toString(),
                          style: poppinsMedium,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight / 30,
                    ),
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
                                  index!.nutritions!.carbohydrates.toString(),
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
                                  index!.nutritions!.protein.toString(),
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
                                  index!.nutritions!.fat.toString(),
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
                                  index!.nutritions!.calories.toString(),
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
                                  index!.nutritions!.sugar.toString(),
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
              )),
        ),
      ),
    );
  }
}
