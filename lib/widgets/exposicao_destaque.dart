import 'package:flutter/material.dart';
import 'package:travel_hour/blocs/sp_state_one.dart';
// import 'package:travel_hour/config/config.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/utils/list_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_hour/blocs/itens_bloc.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
import 'package:intl/intl.dart';

class ExposicaoState extends StatelessWidget {
  ExposicaoState({Key? key}) : super(key: key);

  String _getLocalizedText(BuildContext context, String ptText, String? enText) {
    return context.locale.languageCode == 'en' ? (enText ?? ptText) : ptText;
  }

  @override
  Widget build(BuildContext context) {
    final spb = context.watch<ExposicaoStateBloc>();
    final now = DateTime.now();
    final current = <dynamic>[];
    for (var item in spb.data) {
      if (!(item.data_fim != null && item.data_fim!.toDate().isBefore(now))) {
        current.add(item);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (current.isNotEmpty) ...[
          Container(
            margin: EdgeInsets.only(left: 15, top: 20, right: 15),
            child: Row(
              children: <Widget>[
                Text(
                  'sections.exposicao',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[800],
                      wordSpacing: 1,
                      letterSpacing: -0.6),
                ).tr(),
                Spacer(),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: current.length,
              itemBuilder: (BuildContext context, int index) {
                final item = current[index];
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
          ),
        ],
      ],
    );
  }
}

class ExposicoesAnterioresSection extends StatelessWidget {
  const ExposicoesAnterioresSection({Key? key}) : super(key: key);

  String _getLocalizedText(BuildContext context, String ptText, String? enText) {
    return context.locale.languageCode == 'en' ? (enText ?? ptText) : ptText;
  }

  @override
  Widget build(BuildContext context) {
    final spb = context.watch<ExposicaoStateBloc>();
    final now = DateTime.now();
    final past = <dynamic>[];
    for (var item in spb.data) {
      if (item.data_fim != null && item.data_fim!.toDate().isBefore(now)) {
        past.add(item);
      }
    }
    if (past.isEmpty) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(height: 40, thickness: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            'Exposições Anteriores',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.grey[800],
              wordSpacing: 1,
              letterSpacing: -0.6,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10, right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: past.length,
            itemBuilder: (BuildContext context, int index) {
              final item = past[index];
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
                tag: 'past$index',
                color: Colors.grey[100],
                titulo: titulo,
                subtitulo: subtitulo,
                descricao: descricao,
                imageHeight: 200,
              );
            },
          ),
        ),
      ],
    );
  }
}

// class SpecialState1 extends StatelessWidget {
//   const SpecialState1({Key? key}) : super(key: key);

//   String _getLocalizedText(BuildContext context, String ptText, String enText) {
//     return context.locale.languageCode == 'en' ? (enText ?? ptText) : ptText;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ItensBloc>(
//       builder: (context, itensBloc, child) {
//         if (itensBloc.data.isEmpty) {
//           return Container();
//         }

//         final item = itensBloc.data[0];

//         final String titulo = _getLocalizedText(
//           context,
//           item.titulo ?? 'Nome não disponível',
//           item.titulo_en ?? 'Name not available',
//         );

//         final String descricao = _getLocalizedText(
//           context,
//           item.descricao ?? '',
//           item.descricao_en ?? '',
//         );

//         return Container(
//           height: MediaQuery.of(context).size.height,
//           width: double.infinity,
//           child: Stack(
//             children: <Widget>[
//               // IMAGEM DIRETA COM HERO E BoxFit.cover
//               Positioned.fill(
//                 child: Hero(
//                   tag: 'special-${item.timestamp}',
//                   child: Image.network(
//                     item.imagem ?? '',
//                     width: double.infinity,
//                     height: double.infinity,
//                     fit: BoxFit
//                         .cover, // Isso faz a imagem cobrir todo o espaço disponível
//                   ),
//                 ),
//               ),
//               // GRADIENTE NO FUNDO
//               Positioned(
//                 height: 120,
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                       colors: [
//                         Colors.black.withOpacity(0.7),
//                         Colors.transparent,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               // TEXTOS
//               Positioned(
//                 bottom: 20,
//                 left: 20,
//                 right: 20,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       titulo,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                         fontWeight: FontWeight.w900,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       descricao,
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.8),
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
