import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/blog_bloc.dart';
import 'package:travel_hour/blocs/state_bloc.dart';
import 'package:travel_hour/models/colors.dart';
import 'package:travel_hour/models/exposicao.dart';
import 'package:travel_hour/pages/exposicao_details.dart';

import 'package:travel_hour/utils/empty.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
import 'package:travel_hour/utils/loading_cards.dart';
import 'package:easy_localization/easy_localization.dart';

class ExposicoesPage extends StatefulWidget {
  ExposicoesPage({Key? key}) : super(key: key);

  @override
  _ExposicoesPageState createState() => _ExposicoesPageState();
}

class _ExposicoesPageState extends State<ExposicoesPage>
    with AutomaticKeepAliveClientMixin {
  ScrollController? controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = new ScrollController()..addListener(_scrollListener);
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((value) {
      context.read<StateBloc>().getData(mounted);
    });
  }

  @override
  void dispose() {
    controller!.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    final db = context.read<BlogBloc>();

    if (!db.isLoading) {
      if (controller!.position.pixels == controller!.position.maxScrollExtent) {
        context.read<StateBloc>().setLoading(true);
        context.read<StateBloc>().getData(mounted);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final sb = context.watch<StateBloc>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text('exposições').tr(),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Feather.rotate_cw,
              size: 22,
            ),
            onPressed: () {
              context.read<StateBloc>().onReload(mounted);
            },
          )
        ],
      ),
      body: RefreshIndicator(
        child: sb.hasData == false
            ? ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  EmptyPage(
                      icon: Feather.clipboard,
                      message: 'Nenhuma Exposição Encontrada',
                      message1: ''),
                ],
              )
            : ListView.separated(
                padding: EdgeInsets.all(15),
                controller: controller,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: sb.data.length != 0 ? sb.data.length + 1 : 8,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10,
                ),

                //shrinkWrap: true,
                itemBuilder: (_, int index) {
                  if (index < sb.data.length) {
                    return _ItemList(d: sb.data[index]);
                  }
                  return Opacity(
                    opacity: sb.isLoading ? 1.0 : 0.0,
                    child: sb.lastVisible == null
                        ? LoadingCard(height: 140)
                        : Center(
                            child: SizedBox(
                                width: 32.0,
                                height: 32.0,
                                child: new CupertinoActivityIndicator()),
                          ),
                  );
                },
              ),
        onRefresh: () async {
          context.read<StateBloc>().onRefresh(mounted);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ItemList extends StatelessWidget {
  final ExposicaoModel d;
  const _ItemList({Key? key, required this.d}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          height: 140,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CustomCacheImage(
                      imageUrl: d.thumbnail,
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  d.name!.toUpperCase(),
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          )),
      onTap: () => nextScreen(
          context,
          ExposicaoDetails(
            name: d.name,
            color: (ColorList().randomColors..shuffle()).first,
            exposicaoId: d.exposicaoId,
            descricao: d.descricao,
            descricao_en: d.descricao_en,
            curador: d.curador,
            subtitulo: d.subtitulo,
            subtitulo_en: d.subtitulo_en,
            url_libras: d.url_libras,
            url_audiodescricao: d.url_audiodescricao,
            data_inicio: d.data_inicio,
            data_fim: d.data_fim,
          )),
    );
  }
}
