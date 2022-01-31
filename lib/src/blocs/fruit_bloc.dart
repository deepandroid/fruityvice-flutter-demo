import 'package:fruityvice/src/models/iteam_model.dart';
import 'package:fruityvice/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class FruitBloc {
  final _repository = Repository();
  final _fruitDataFetcher = PublishSubject<List<ItemModel>>();
  final _searchFruitItem = PublishSubject<ItemModel>();

  Stream<List<ItemModel>> get allFruitsData => _fruitDataFetcher.stream;

  Stream<ItemModel> get searchFruitsData => _searchFruitItem.stream;

  fetchFruitsDetails() async {
    List<ItemModel> dataModel = await _repository.fetchAllFruitData();
    _fruitDataFetcher.sink.add(dataModel);
  }

  searchFruitDetails(String fruitName) async {
    ItemModel? dataModel = await _repository.searchFruitName(fruitName);
    _searchFruitItem.sink.add(dataModel!);
  }

  dispose() {
    _fruitDataFetcher.close();
    _searchFruitItem.close();
  }
}

final bloc = FruitBloc();
