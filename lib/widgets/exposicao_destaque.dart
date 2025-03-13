import 'package:flutter/material.dart';
import 'package:travel_hour/blocs/sp_state_one.dart';
import 'package:travel_hour/models/colors.dart';
// import 'package:travel_hour/config/config.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/pages/exposicao_details.dart';
import 'package:travel_hour/utils/list_card.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_hour/blocs/itens_bloc.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
import 'package:travel_hour/utils/loading_cards.dart';

class ExposicaoState extends StatelessWidget {
  ExposicaoState({Key? key}) : super(key: key);

  String _getLocalizedText(BuildContext context, String ptText, String enText) {
    return context.locale.languageCode == 'en' ? (enText ?? ptText) : ptText;
  }

  @override
  Widget build(BuildContext context) {
    final spb = context.watch<ExposicaoStateBloc>();

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 15,
            top: 20,
            right: 15,
          ),
          child: Row(
            children: <Widget>[
              Text(
                'Exposição',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[800],
                    wordSpacing: 1,
                    letterSpacing: -0.6),
              ).tr(),
              Spacer(),
              // IconButton(
              //   icon: Icon(Icons.arrow_forward),
              //   onPressed: () => nextScreen(
              //       context,
              //       ExposicaoDetails(
              //         titulo: spb.data[0].titulo,
              //         titulo_en: spb.data[0].titulo_en,
              //         color: (ColorList().randomColors..shuffle()).first,
              //         exposicaoId: spb.data[0].exposicaoId,
              //         descricao: spb.data[0].descricao,
              //         descricao_en: spb.data[0].descricao_en,
              //         curador: spb.data[0].curador,
              //         subtitulo: spb.data[0].subtitulo,
              //         subtitulo_en: spb.data[0].subtitulo_en,
              //         url_libras: spb.data[0].url_libras,
              //         url_audiodescricao: spb.data[0].url_audiodescricao,
              //         data_inicio: spb.data[0].data_inicio,
              //       )),
              // )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10, right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: spb.data.isEmpty ? 4 : 1,
            itemBuilder: (BuildContext context, int index) {
              if (spb.data.isEmpty) return Container();
              final item = spb.data[index];
              final String titulo = _getLocalizedText(
                context,
                item.titulo ?? 'Nome não disponível',
                item.titulo_en ?? 'Name not available',
              );
              final String subtitulo = _getLocalizedText(
                context,
                item.subtitulo ?? '',
                item.subtitulo_en ?? '',
              );
              final String descricao = _getLocalizedText(
                context,
                item.descricao ?? '',
                item.descricao_en ?? '',
              );
              return ListCard(
                d: item,
                tag: 'sp1$index',
                color: Colors.grey[200],
                titulo: titulo,
                subtitulo: subtitulo,
                descricao: descricao,
              );
            },
          ),
        )
      ],
    );
  }
}

class SpecialState1 extends StatelessWidget {
  const SpecialState1({Key? key}) : super(key: key);

  String _getLocalizedText(BuildContext context, String ptText, String enText) {
    return context.locale.languageCode == 'en' ? (enText ?? ptText) : ptText;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItensBloc>(
      builder: (context, itensBloc, child) {
        if (itensBloc.data.isEmpty) {
          return Container();
        }

        final item = itensBloc.data[0]; // Pegando o primeiro item

        final String titulo = _getLocalizedText(
          context,
          item.titulo ?? 'Nome não disponível',
          item.titulo_en ?? 'Name not available',
        );

        final String descricao = _getLocalizedText(
          context,
          item.descricao ?? '',
          item.descricao_en ?? '',
        );

        return Container(
          height: 320,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                height: 320,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                ),
                child: Hero(
                  tag: 'special-${item.timestamp}',
                  child: CustomCacheImage(imageUrl: item.imagem ?? ''),
                ),
              ),
              Positioned(
                height: 120,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      titulo,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Text(
                      descricao,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
