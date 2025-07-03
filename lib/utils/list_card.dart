import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:travel_hour/models/item.dart';
import 'package:travel_hour/pages/item_details.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
import 'package:travel_hour/pages/exposicao_details.dart';

class ListCard extends StatelessWidget {
  final dynamic d;
  final String? tag;
  final Color? color;
  final String? titulo;
  final String? subtitulo;
  final String? descricao;
  final double imageHeight;

  const ListCard({
    Key? key,
    required this.d,
    required this.tag,
    required this.color,
    this.titulo,
    this.subtitulo,
    this.descricao,
    this.imageHeight = 400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: imageHeight,
              child: CustomCacheImage(
                imageUrl: d?.thumbnail ?? '',
              ),
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
              bottom: 10,
              left: 15,
              right: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo ?? 'Sem título',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if (subtitulo != null && subtitulo!.isNotEmpty)
                    Text(
                      subtitulo!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () => nextScreen(
        context,
        ExposicaoDetails(
          titulo: d?.titulo ?? '',
          titulo_en: d?.titulo_en ?? '',
          subtitulo: d?.subtitulo ?? '',
          subtitulo_en: d?.subtitulo_en ?? '',
          descricao: d?.descricao ?? '',
          descricao_en: d?.descricao_en ?? '',
          exposicaoId: d?.exposicaoId ?? '',
          curador: d?.curador ?? '',
          url_libras: d?.url_libras ?? '',
          url_audiodescricao: d?.url_audiodescricao ?? '',
          data_inicio: d?.data_inicio ?? '',
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
