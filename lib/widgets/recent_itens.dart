import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/itens_bloc.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
import 'package:travel_hour/utils/loading_cards.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_hour/pages/item_details.dart';
import 'package:travel_hour/blocs/sp_state_one.dart';

class RecentItens extends StatelessWidget {
  const RecentItens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<ItensBloc, ExposicaoStateBloc>(
      builder: (context, itensBloc, exposicaoBloc, child) {
        final now = DateTime.now();
        print('--- Exposições carregadas ---');
        for (var exp in exposicaoBloc.data) {
          print('exposicaoId: \'${exp.exposicaoId}\' | data_fim: \'${exp.data_fim?.toDate()}\'');
        }
        // Map exposicaoId to data_fim
        final exposicoesAtivas = <String>{};
        for (var exp in exposicaoBloc.data) {
          final isAtiva = exp.exposicaoId != null && (exp.data_fim == null || exp.data_fim!.toDate().isAfter(now));
          print('exposicaoId: \'${exp.exposicaoId}\' | ativa: $isAtiva');
          if (isAtiva) {
            exposicoesAtivas.add(exp.exposicaoId!.trim().toLowerCase());
          }
        }
        print('Exposições ativas:');
        exposicoesAtivas.forEach(print);
        final filteredItens = itensBloc.data.where((item) {
          if (item.exposicaoId == null) return false;
          final itemId = item.exposicaoId!.trim().toLowerCase();
          final match = exposicoesAtivas.contains(itemId);
          print('Obra: ${item.titulo} | exposicaoId: ${item.exposicaoId} | match: $match');
          return match;
        }).toList();
        final isLoading = itensBloc.isLoading;
        return Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, top: 20, right: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    'sections.itens_recentes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[800],
                      wordSpacing: 1,
                      letterSpacing: -0.6,
                    ),
                  ).tr(),
                  Spacer(),
                ],
              ),
            ),
            Container(
              height: 245,
              width: MediaQuery.of(context).size.width,
              child: Builder(
                builder: (_) {
                  if (isLoading) {
                    return ListView.builder(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) => LoadingPopularPlacesCard(),
                    );
                  } else if (filteredItens.isEmpty) {
                    return Center(
                      child: Text(
                        'Nenhuma obra recente disponível',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredItens.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = filteredItens[index];
                        return _ItemCard(data: item);
                      },
                    );
                  }
                },
              ),
            )
          ],
        );
      },
    );
  }
}

class _ItemCard extends StatelessWidget {
  final dynamic data;
  const _ItemCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 0, right: 10, top: 5, bottom: 5),
        width: MediaQuery.of(context).size.width * 0.40,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Hero(
                tag: '',
                child: CustomCacheImage(imageUrl: data.imagem ?? ''),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 10,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.titulo ?? 'Nome não disponível',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      data.descricao ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        nextScreen(
          context,
          ItemDetails(
            data: data,
            tag: 'recent${data.timestamp ?? ''}',
          ),
        );
      },
    );
  }
}
