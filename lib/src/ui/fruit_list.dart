import 'package:flutter/material.dart';
import 'package:fruityvice/src/blocs/fruit_bloc.dart';
import 'package:fruityvice/src/models/iteam_model.dart';
import 'package:fruityvice/src/util/dimensions.dart';

import 'item_view.dart';

class FruitListData extends StatefulWidget {
  const FruitListData({Key? key}) : super(key: key);

  @override
  _FruitListDataState createState() => _FruitListDataState();
}

class _FruitListDataState extends State<FruitListData> {
  @override
  void initState() {
    super.initState();
    bloc.fetchFruitsDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white24,
        body: StreamBuilder(
          stream: bloc.allFruitsData,
          builder: (context, AsyncSnapshot<List<ItemModel>> snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: Dimensions.screenHeight,
                width: Dimensions.screenHeight,
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.screenWidth / 40,
                          right: Dimensions.screenWidth / 40,
                        ),
                        child: CardItemView(index: snapshot.data![index]),
                      );
                    }),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Container(
                height: Dimensions.screenHeight / 1.2,
                child: const Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                )));
          },
        ));
  }
}
