import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_hour/config/config.dart';
import 'package:travel_hour/models/item.dart';

class SpecialStateTwoBloc extends ChangeNotifier {
  List<ItemModel> _data = [];
  List<ItemModel> get data => _data;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getData() async {
    QuerySnapshot rawData;
    rawData = await firestore
        .collection('places')
        .where('state', isEqualTo: Config().specialState2)
        .orderBy('loves', descending: true)
        .limit(4)
        .get();

    List<DocumentSnapshot> _snap = [];
    _snap.addAll(rawData.docs);
    _data = _snap.map((e) => ItemModel.fromFirestore(e)).toList();
    notifyListeners();
  }

  onRefresh(mounted) {
    _data.clear();
    getData();
    notifyListeners();
  }
}
