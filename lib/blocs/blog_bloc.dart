import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_hour/models/blog.dart';

class BlogBloc extends ChangeNotifier {
  DocumentSnapshot? _lastVisible;
  DocumentSnapshot? get lastVisible => _lastVisible;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<Blog> _data = [];
  List<Blog> get data => _data;

  String _popSelection = 'popular';
  String get popupSelection => _popSelection;

  List<DocumentSnapshot> _snap = [];
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool? _hasData;
  bool? get hasData => _hasData;

  Future<Null> getData(mounted, String orderBy) async {
    _hasData = true;
    QuerySnapshot rawData;

    if (_lastVisible == null)
      rawData = await firestore
          .collection('blogs')
          .orderBy(orderBy, descending: true)
          .limit(10)
          .get();
    else
      rawData = await firestore
          .collection('blogs')
          .orderBy(orderBy, descending: true)
          .startAfter([_lastVisible![orderBy]])
          .limit(10)
          .get();

    if (rawData.docs.length > 0) {
      _lastVisible = rawData.docs[rawData.docs.length - 1];
      if (mounted) {
        _isLoading = false;
        _snap.addAll(rawData.docs);
        _data = _snap.map((e) => Blog.fromFirestore(e)).toList();
      }
    } else {
      if (_lastVisible == null) {
        _isLoading = false;
        _hasData = false;
        debugPrint('no items');
      } else {
        _isLoading = false;
        _hasData = true;
        debugPrint('no more items');
      }
    }

    notifyListeners();
    return null;
  }

  afterPopSelection(value, mounted, orderBy) {
    _popSelection = value;
    onRefresh(mounted, orderBy);
    notifyListeners();
  }

  setLoading(bool isloading) {
    _isLoading = isloading;
    notifyListeners();
  }

  onRefresh(mounted, orderBy) {
    _isLoading = true;
    _snap.clear();
    _data.clear();
    _lastVisible = null;
    getData(mounted, orderBy);
    notifyListeners();
  }

  Future<void> loadMore(String orderBy) async {
    try {
      if (_data.isEmpty || _lastVisible == null) return;

      QuerySnapshot rawData = await firestore
          .collection('blogs')
          .orderBy(orderBy, descending: true)
          .startAfter([_lastVisible![orderBy]])
          .limit(10)
          .get();

      if (rawData.docs.length > 0) {
        _lastVisible = rawData.docs[rawData.docs.length - 1];
        _snap.addAll(rawData.docs);
        _data = _snap.map((e) => Blog.fromFirestore(e)).toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error in loadMore: $e');
    }
  }
}
