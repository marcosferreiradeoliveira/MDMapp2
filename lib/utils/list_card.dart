import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:travel_hour/models/item.dart';
import 'package:travel_hour/pages/item_details.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
import 'package:travel_hour/models/exposicao.dart';
import 'package:travel_hour/pages/exposicao_details.dart';

class ListCard extends StatelessWidget {
  final ExposicaoModel? d;
  final String tag;
  final Color? color;

  const ListCard({
    Key? key,
    required this.d,
    required this.tag,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: <Widget>[
            // Imagem de fundo
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: CustomCacheImage(
                imageUrl: d?.thumbnail ?? '',
              ),
            ),

            // Camada de sombra
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

            // Título em branco
            Positioned(
              bottom: 10,
              left: 15,
              right: 15,
              child: Text(
                d?.name ?? 'No name',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Garante que o título fique branco
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => nextScreen(
        context,
        ExposicaoDetails(
          exposicaoId: d?.exposicaoId ?? '',
          descricao_en: d?.descricao_en ?? '',
          name: d?.name ?? '',
          descricao: d?.descricao ?? '',
          color: color ?? Colors.grey[200],
        ),
      ),
    );
  }
}

// ----------------------------------------------------
// Segundo modelo de card atualizado
// ----------------------------------------------------

class ListCard1 extends StatelessWidget {
  final ItemModel d;
  final String? tag;

  const ListCard1({Key? key, required this.d, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: <Widget>[
            // Imagem de fundo
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: CustomCacheImage(
                imageUrl: d.imagem,
              ),
            ),

            // Camada de sombra
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

            // Título em branco
            Positioned(
              bottom: 10,
              left: 15,
              right: 15,
              child: Text(
                d.titulo!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Garante que o título fique branco
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => nextScreen(
        context,
        ItemDetails(data: d, tag: tag),
      ),
    );
  }
}
