import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_hour/models/item.dart';
import 'package:travel_hour/pages/item_details.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
import 'package:travel_hour/utils/loading_cards.dart';
import 'package:easy_localization/easy_localization.dart';

class MaisItensPage extends StatefulWidget {
  final String title;
  final Color? color;
  MaisItensPage({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  _MaisItensPageState createState() => _MaisItensPageState();
}

class _MaisItensPageState extends State<MaisItensPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String collectionName = 'Item';
  ScrollController? controller;
  DocumentSnapshot? _lastVisible;
  late bool _isLoading;
  List<DocumentSnapshot> _snap = [];
  List<ItemModel> _data = [];
  late bool _descending;
  late String _orderBy;

  @override
  void initState() {
    controller = new ScrollController()..addListener(_scrollListener);
    super.initState();
    _isLoading = true;
    if (widget.title == 'popular') {
      _orderBy = 'loves';
      _descending = true;
    } else if (widget.title == 'recommended') {
      _orderBy = 'comments count';
      _descending = true;
    } else {
      _orderBy = 'timestamp';
      _descending = false;
    }
    _getData();
  }

  onRefresh() {
    setState(() {
      _snap.clear();
      _data.clear();
      _isLoading = true;
      _lastVisible = null;
    });
    _getData();
  }

  Future<Null> _getData() async {
    QuerySnapshot data;
    if (_lastVisible == null)
      data = await firestore
          .collection(collectionName)
          // .orderBy(_orderBy, descending: _descending)
          // .limit(5)
          .get();
    else
      data = await firestore
          .collection(collectionName)
          // .orderBy(_orderBy, descending: _descending)
          // .startAfter([_lastVisible![_orderBy]])
          // .limit(5)
          .get();

    if (data.docs.length > 0) {
      _lastVisible = data.docs[data.docs.length - 1];
      if (mounted) {
        setState(() {
          _isLoading = false;
          _snap.addAll(data.docs);
          _data = _snap.map((e) => ItemModel.fromFirestore(e)).toList();
        });
      }
    } else {
      setState(() => _isLoading = false);
    }
    return null;
  }

  @override
  void dispose() {
    controller!.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (!_isLoading) {
      if (controller!.position.pixels == controller!.position.maxScrollExtent) {
        setState(() => _isLoading = true);
        _getData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: CustomScrollView(
          controller: controller,
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading:
                  false, // Não coloca o ícone automaticamente
              pinned: true,
              leading: null, // Não usa o ícone automático
              backgroundColor: Colors.red[100],
              expandedHeight: 80,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                background: Container(
                  color: Colors.grey[100],
                  height: 80,
                  width: double.infinity,
                ),
                titlePadding:
                    EdgeInsets.zero, // Remover o padding padrão do título
                title: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left, // Seta para a esquerda
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 10), // Espaçamento entre a seta e o título
                    Expanded(
                      child: Text(
                        '${widget.title}',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ).tr(),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(15),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index < _data.length) {
                      return _ListItem(
                        d: _data[index],
                        tag: '${widget.title}$index',
                      );
                    }
                    return Opacity(
                      opacity: _isLoading ? 1.0 : 0.0,
                      child: _lastVisible == null
                          ? Column(
                              children: [
                                LoadingCard(
                                  height: 180,
                                ),
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            )
                          : Center(
                              child: SizedBox(
                                  width: 32.0,
                                  height: 32.0,
                                  child: new CupertinoActivityIndicator()),
                            ),
                    );
                  },
                  childCount: _data.length == 0 ? 5 : _data.length + 1,
                ),
              ),
            )
          ],
        ),
        onRefresh: () async => onRefresh(),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final ItemModel d;
  final tag;
  const _ListItem({Key? key, required this.d, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 10),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey[200]!,
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: Hero(
                      tag: tag,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: CustomCacheImage(imageUrl: d.imagem)),
                    )),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        d.titulo!,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Icon(
                          //   Feather.map_pin,
                          //   size: 16,
                          //   color: Colors.grey,
                          // ),
                          // SizedBox(
                          //   width: 3,
                          // ),
                          // Expanded(
                          //     child: Text(
                          //     d.location!,
                          //     maxLines: 1,
                          //     style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Icon(
                          //   CupertinoIcons.time,
                          //   size: 16,
                          //   color: Colors.grey[700],
                          // ),
                          // SizedBox(
                          //   width: 3,
                          // ),
                          // Text(
                          //   d.date!,
                          //   style: TextStyle(
                          //       fontSize: 13, color: Colors.grey[700]),
                          // ),
                          // Spacer(),
                          // Icon(
                          //   LineIcons.heart,
                          //   size: 16,
                          //   color: Colors.grey,
                          // ),
                          // // SizedBox(
                          // //   width: 3,
                          // // ),
                          // // Text(
                          // //   d.loves.toString(),
                          // //   style: TextStyle(
                          // //       fontSize: 13, color: Colors.grey[700]),
                          // // ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          // Icon(
                          //   LineIcons.comment,
                          //   size: 16,
                          //   color: Colors.grey,
                          // ),
                          // SizedBox(
                          //   width: 3,
                          // ),
                          // Text(
                          //   d.commentsCount.toString(),
                          //   style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
      onTap: () => nextScreen(context, ItemDetails(data: d, tag: tag)),
    );
  }
}
