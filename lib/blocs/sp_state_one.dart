import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_hour/models/exposicao.dart';
// import 'package:travel_hour/config/config.dart';
// import 'package:travel_hour/models/item.dart';

class SpecialStateOneBloc extends ChangeNotifier {
  List<ExposicaoModel> _data = [];
  List<ExposicaoModel> get data => _data;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getData() async {
    QuerySnapshot rawData;
    rawData = await firestore
        .collection('exposições')
        // .where('state', isEqualTo: Config().specialState1)
        .orderBy('timestamp', descending: true)
        .limit(4)
        .get();

    List<DocumentSnapshot> _snap = [];
    _snap.addAll(rawData.docs);
    _data = _snap.map((e) => ExposicaoModel.fromFirestore(e)).toList();
    notifyListeners();
  }

  onRefresh(mounted) {
    _data.clear();
    getData();
    notifyListeners();
  }
}
