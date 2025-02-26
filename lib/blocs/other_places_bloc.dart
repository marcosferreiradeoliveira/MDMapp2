import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:travel_hour/models/item.dart';

class OtherPlacesBloc extends ChangeNotifier {
  List<ItemModel> _data = [];
  List<ItemModel> get data => _data;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getData(String? stateName, String? timestamp) async {
    _data.clear();
    QuerySnapshot rawData;
    rawData = await firestore
        .collection('places')
        .where('state', isEqualTo: stateName)
        .where('timestamp', isNotEqualTo: timestamp)
        .orderBy('timestamp', descending: true)
        .limit(6)
        .get();

    List<DocumentSnapshot> _snap = [];
    _snap.addAll(rawData.docs);
    _data = _snap.map((e) => ItemModel.fromFirestore(e)).toList();
    notifyListeners();
  }

  onRefresh(mounted, String stateName, String timestamp) {
    _data.clear();
    getData(stateName, timestamp);
    notifyListeners();
  }
}
