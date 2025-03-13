import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/itens_bloc.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
import 'package:travel_hour/utils/loading_cards.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_hour/pages/item_details.dart';

class RecentItens extends StatelessWidget {
  const RecentItens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ItensBloc>(
      builder: (context, itensBloc, child) {
        return Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, top: 20, right: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    'itens_recentes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
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
              child: ListView.builder(
                padding: EdgeInsets.only(left: 15, right: 15),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: itensBloc.data.isEmpty ? 3 : itensBloc.data.length,
                itemBuilder: (BuildContext context, int index) {
                  if (itensBloc.data.isEmpty) return LoadingPopularPlacesCard();

                  final item = itensBloc.data[index];
                  return _ItemCard(data: item);
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
