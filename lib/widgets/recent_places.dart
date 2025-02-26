import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/recent_places_bloc.dart';
import 'package:travel_hour/models/item.dart';
import 'package:travel_hour/pages/more_places.dart';
import 'package:travel_hour/pages/item_details.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
import 'package:travel_hour/utils/loading_cards.dart';
import 'package:easy_localization/easy_localization.dart';

class RecentPlaces extends StatelessWidget {
  RecentPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rb = context.watch<RecentPlacesBloc>();

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, top: 20, right: 10),
          child: Row(
            children: <Widget>[
              Text(
                'recently added',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900],
                    wordSpacing: 1,
                    letterSpacing: -0.6),
              ).tr(),
              Spacer(),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () => nextScreen(
                    context,
                    MorePlacesPage(
                      title: 'recently added',
                      color: Colors.blueGrey[600],
                    )),
              )
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
            itemCount: rb.data.isEmpty ? 2 : rb.data.length,
            itemBuilder: (BuildContext context, int index) {
              if (rb.data.isEmpty) return LoadingPopularPlacesCard();

              final item = rb.data[index];
              if (item == null) return SizedBox(); // Evita passar valores null

              return _ItemList(d: item);
            },
          ),
        )
      ],
    );
  }
}

class _ItemList extends StatelessWidget {
  final ItemModel d;
  const _ItemList({Key? key, required this.d}) : super(key: key);

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
        child: Stack(
          children: [
            Hero(
              tag: 'recent${d.timestamp ?? ''}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomCacheImage(imageUrl: d.imagem ?? ''),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                child: Text(
                  d.titulo ??
                      'Nome não disponível', // Corrigido para evitar erro de null
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, right: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[600]!.withOpacity(0.5),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () => nextScreen(
          context, ItemDetails(data: d, tag: 'recent${d.timestamp ?? ''}')),
    );
  }
}
