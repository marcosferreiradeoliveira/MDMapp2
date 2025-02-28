import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_icons/line_icons.dart';
// import 'package:travel_hour/models/exposicao.dart';
import 'package:travel_hour/models/item.dart';
import 'package:travel_hour/pages/item_details.dart';
import 'package:travel_hour/utils/empty.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
import 'package:travel_hour/utils/loading_cards.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_hour/widgets/html_body.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class ExposicaoDetails extends StatefulWidget {
  final String? descricao;
  final String? descricao_en;
  final String? name;
  final String? curador;
  final String? thumbnail;
  final String? timestamp;
  final String? subtitulo;
  final String? subtitulo_en;
  final String? url_libras;
  final String? exposicaoId;
  final String? url_audiodescricao;
  final DateTime? data_inicio;
  final DateTime? data_fim;
  final Color? color;

  const ExposicaoDetails({
    Key? key,
    this.name,
    this.thumbnail,
    this.descricao,
    this.descricao_en,
    this.timestamp,
    this.curador,
    this.subtitulo,
    this.subtitulo_en,
    this.url_libras,
    this.exposicaoId,
    this.url_audiodescricao,
    this.data_inicio,
    this.data_fim,
    this.color,
  }) : super(key: key);

  @override
  State<ExposicaoDetails> createState() => _ExposicaoDetailsState();
}

class _ExposicaoDetailsState extends State<ExposicaoDetails> {
  bool _isLoading = true;
  // bool _hasData = false;
  List<DocumentSnapshot> _snap = [];
  List<ItemModel> _data = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name ?? ''),
        backgroundColor: widget.color,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                widget.color == null
                    ? _slidableImages()
                    : Hero(
                        tag: widget.color!,
                        child: _slidableImages(),
                      ),
                Positioned(
                  top: 20,
                  left: 15,
                  child: SafeArea(
                    child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.9),
                      child: IconButton(
                        icon: Icon(
                          LineIcons.arrowLeft,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 8, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: <Widget>[
                  //     Icon(
                  //       Icons.location_on,
                  //       size: 20,
                  //       color: Colors.grey,
                  //     ),
                  //     Expanded(
                  //         child: Text(
                  //       widget.data!.location!,
                  //       style: TextStyle(
                  //         fontSize: 13,
                  //         color: Colors.grey[600],
                  //       ),
                  //       maxLines: 2,
                  //       overflow: TextOverflow.ellipsis,
                  //     )),
                  //     IconButton(
                  //         icon: BuildLoveIcon(
                  //             collectionName: collectionName,
                  //             uid: sb.uid,
                  //             timestamp: widget.data!.timestamp),
                  //         onPressed: () {
                  //           handleLoveClick();
                  //         }),
                  //     IconButton(
                  //         icon: BuildBookmarkIcon(
                  //             collectionName: collectionName,
                  //             uid: sb.uid,
                  //             timestamp: widget.data!.timestamp),
                  //         onPressed: () {
                  //           handleBookmarkClick();
                  //         }),
                  //   ],
                  // ),
                  Text(widget.name!,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.6,
                          wordSpacing: 1,
                          color: Colors.grey[800])),
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    height: 3,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  // Row(
                  //   children: <Widget>[
                  //     // LoveCount(
                  //     //     collectionName: collectionName,
                  //     //     timestamp: widget.data!.timestamp),
                  //     // SizedBox(
                  //     //   width: 20,
                  //     // ),
                  //     // Icon(
                  //     //   Feather.message_circle,
                  //     //   color: Colors.grey,
                  //     //   size: 20,
                  //     // ),
                  //     // SizedBox(
                  //     //   width: 2,
                  //     // ),
                  //     // CommentCount(
                  //     //     collectionName: collectionName,
                  //     //     timestamp: widget.data!.timestamp)
                  //   ],
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 8, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HtmlBodyWidget(
                    content: widget.descricao.toString(),
                    isIframeVideoEnabled: true,
                    isVideoEnabled: true,
                    isimageEnabled: true,
                    fontSize: null,
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(20),
            //   child: TodoWidget(placeData: widget.data),
            // ),
            Text('Id : ${widget.exposicaoId}'),
            // Text('Data : ${_data[0].titulo}'),
            Text(
                'Detalhes da exposição: ${widget.descricao ?? widget.descricao_en}'),
            Text('Curador: ${widget.curador ?? widget.name}'),

            // Mostrar status do carregamento
            // if (_isLoading) Center(child: CircularProgressIndicator()),

            // // Mostrar mensagem se não houver dados
            // if (!_isLoading && !_hasData)
            //   Center(child: Text('Nenhum item encontrado')),

            // Mostrar lista de itens
            // if (!_isLoading && _hasData)
            //   ListView.builder(
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     itemCount: _data.length,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         margin: EdgeInsets.only(bottom: 15),
            //         child: ListTile(
            //           title: Text(_data[index].titulo ?? 'Sem título'),
            //           subtitle: Text(_data[index].descricao ?? 'Sem descrição'),
            //           leading: _data[index].imagem != null
            //               ? Image.network(
            //                   _data[index].imagem!,
            //                   width: 50,
            //                   height: 50,
            //                   fit: BoxFit.cover,
            //                 )
            //               : Icon(Icons.image),
            //         ),
            //       );
            //     },
            //   ),
          ],
        ),
      ),
    );
  }

  Container _slidableImages() {
    return Container(
      color: Colors.white,
      child: Container(
        height: 320,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: AnotherCarousel(
            dotBgColor: Colors.transparent,
            showIndicator: true,
            dotSize: 5,
            dotSpacing: 15,
            boxFit: BoxFit.cover,
            images: [
              CustomCacheImage(
                  imageUrl:
                      'https://www.aen.pr.gov.br/sites/default/arquivos_restritos/files/imagem/2023-02/exposicao_fora_das_sombras_1._credito_marcello_kawase.jpg'),
              // CustomCacheImage(imageUrl: widget.data!.imageUrl2),
              // CustomCacheImage(imageUrl: widget.data!.imageUrl3),
            ]),
      ),
    );
  }

  Future<Null> _getData() async {
    // setState(() => _hasData = true);
    QuerySnapshot data;
    if (_isLoading) {
      data = await FirebaseFirestore.instance
          .collection('Item')
          .where('exposicaoId', isEqualTo: widget.exposicaoId)
          .get();
      debugPrint(
          'Número de documentos encontrados: ${data.docs.length}'); // Verifique quantos documentos foram retornados

      if (data.docs.length > 0) {
        _snap.addAll(data.docs);
        _data = _snap.map((e) => ItemModel.fromFirestore(e)).toList();
        debugPrint('Número de itens encontrados: ${_data.length}');
        for (var item in _data) {
          debugPrint(
              'Item: ${item.titulo}'); // Verifique o conteúdo de cada item
        }
        // Verifique quantos itens foram carregados
      } else {
        setState(() {
          _isLoading = false;
          // _hasData = false;
          debugPrint('Nada encontrado');
        });
      }
    }
    return null;
  }
}

class exposicaoDetails extends StatefulWidget {
  final String? exposicaoId;
  final Color? color;
  exposicaoDetails({Key? key, required this.exposicaoId, required this.color})
      : super(key: key);

  @override
  State<exposicaoDetails> createState() => _exposicaoDetails();
}

class _exposicaoDetails extends State<exposicaoDetails> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String collectionName = 'Item';
  ScrollController? controller;
  DocumentSnapshot? _lastVisible;
  late bool _isLoading;
  List<DocumentSnapshot> _snap = [];
  List<ItemModel> _data = [];
  bool? _hasData;

  @override
  void initState() {
    controller = new ScrollController()..addListener(_scrollListener);
    super.initState();
    _isLoading = true;
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
    setState(() => _hasData = true);
    QuerySnapshot data;
    if (_lastVisible == null)
      data = await firestore
          .collection(collectionName)
          .where('exposicaoId', isEqualTo: widget.exposicaoId)
          // .orderBy('loves', descending: true)
          // .limit(5)
          .get();
    else
      data = await firestore
          .collection(collectionName)
          .where('exposicaoId', isEqualTo: widget.exposicaoId)
          // .orderBy('loves', descending: true)
          // .startAfter([_lastVisible!['loves']])
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
      if (_lastVisible == null) {
        setState(() {
          _isLoading = false;
          _hasData = false;
          debugPrint('Nada encontrado');
        });
      } else {
        setState(() {
          _isLoading = false;
          _hasData = true;
          debugPrint('Não há mais itens');
        });
      }
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
              automaticallyImplyLeading: false,
              pinned: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
              backgroundColor: widget.color,
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                background: Container(
                  color: widget.color,
                  height: 120,
                  width: double.infinity,
                ),
                title: Text(
                  widget.exposicaoId!.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                titlePadding: EdgeInsets.only(left: 20, bottom: 15, right: 15),
              ),
            ),
            _hasData == false
                ? SliverFillRemaining(
                    child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.30,
                      ),
                      EmptyPage(
                          icon: Feather.clipboard,
                          message: 'nenhum item encontrado'.tr(),
                          message1: ''),
                    ],
                  ))
                : SliverPadding(
                    padding: EdgeInsets.all(15),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index < _data.length) {
                            return _ListItem(
                              d: _data[index],
                              tag: '${_data[index].timestamp}$index',
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
                                        child:
                                            new CupertinoActivityIndicator()),
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
  final String tag;
  const _ListItem({Key? key, required this.d, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 15),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
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
                          Icon(
                            Feather.map_pin,
                            size: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Expanded(
                            child: Text(
                              d.titulo!,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            CupertinoIcons.time,
                            size: 16,
                            color: Colors.grey[700],
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            d.date!,
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[700]),
                          ),
                          Spacer(),
                          Icon(
                            LineIcons.heart,
                            size: 16,
                            color: Colors.grey,
                          ),
                          // SizedBox(
                          //   width: 3,
                          // ),
                          // Text(
                          //   d.loves.toString(),
                          //   style: TextStyle(
                          //       fontSize: 13, color: Colors.grey[700]),
                          // ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            LineIcons.comment,
                            size: 16,
                            color: Colors.grey,
                          ),
                          // SizedBox(
                          //   width: 3,
                          // ),
                          // Text(
                          //   d.commentsCount.toString(),
                          //   style: TextStyle(
                          //       fontSize: 13, color: Colors.grey[700]),
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
