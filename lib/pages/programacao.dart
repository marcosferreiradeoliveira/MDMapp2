import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:travel_hour/blocs/ads_bloc.dart';
// import 'package:travel_hour/blocs/bookmark_bloc.dart';
// import 'package:travel_hour/blocs/sign_in_bloc.dart';
// import 'package:travel_hour/utils/sign_in_dialog.dart';
// import 'package:travel_hour/widgets/bookmark_icon.dart';
// import 'package:travel_hour/widgets/comment_count.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
// import 'package:travel_hour/widgets/love_count.dart';
// import 'package:travel_hour/widgets/love_icon.dart';
import 'package:travel_hour/widgets/other_places.dart';
// import 'package:provider/provider.dart';
// import 'package:travel_hour/widgets/todo.dart';

class Programacao extends StatefulWidget {
  // final ItemModel? data;
  // final String? tag;

  const Programacao({Key? key}) : super(key: key);
  // : super(key: key);

  @override
  _ProgramacaoState createState() => _ProgramacaoState();
}

class _ProgramacaoState extends State {
  // final String collectionName = 'places';
  final Uri _url =
      Uri.parse('https://Programacao.ccbb.com.br/cidades/sao-paulo-sp');

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((value) async {
      // context.read<AdsBloc>().initiateAds();
    });
  }

  // handleLoveClick() {
  //   bool _guestUser = context.read<SignInBloc>().guestUser;
  //   if (_guestUser == true) {
  //     openSignInDialog(context);
  //   } else {
  //     context
  //         .read<BookmarkBloc>()
  //         .onLoveIconClick(collectionName, widget.data!.timestamp);
  //   }
  // }

  // handleBookmarkClick() {
  //   bool _guestUser = context.read<SignInBloc>().guestUser;
  //   if (_guestUser == true) {
  //     openSignInDialog(context);
  //   } else {
  //     context
  //         .read<BookmarkBloc>()
  //         .onBookmarkIconClick(collectionName, widget.data!.timestamp);
  //   }
  // }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final SignInBloc sb = context.watch<SignInBloc>();

    // final SignInBloc sb = context.watch<SignInBloc>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                // widget.tag == null
                //     ? _slidableImages()
                //     :
                Hero(
                  tag: 'Programacao',
                  child: _slidableImages(),
                ),
                // Positioned(
                //   top: 20,
                //   left: 15,
                //   child: SafeArea(
                //     child: CircleAvatar(
                //       backgroundColor:
                //           Theme.of(context).primaryColor.withOpacity(0.9),
                //       child: IconButton(
                //         icon: Icon(
                //           LineIcons.arrowLeft,
                //           color: Colors.white,
                //         ),
                //         onPressed: () {
                //           Navigator.pop(context);
                //         },
                //       ),
                //     ),
                //   ),
                // ),
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
                  Text('Programação',
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
                  Text(
                    'Em 8 de março, Dia Internacional da Mulher e data de abertura da exposição, o público poderá conferir uma programação especial.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bate-papo: a mostra estará aberta das 9h às 20h, e às 11h, no Cinema, acontece um bate-papo com as artistas Evna Moura, Renata Aguiar e Leila Jinkings, sob a mediação da curadora Sissa Aneleh.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Apresentação: no período da tarde, às 14h, haverá a apresentação Som em Cena: Encantarias Amazônidas, uma experiência sonora, realizada pelo CCBB Educativo, que se estende até 14h25 no Mezanino.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Show: encerrando a programação do dia, o show Vertentes: Ritmos do Pará, com Ellie Valente e Liége, acontece das 16h às 17h30, também no Mezanino, trazendo a riqueza musical da região em uma celebração vibrante da cultura amazônica.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(20),
            //   child: TodoWidget(placeData: widget.data),
            // ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 0, bottom: 40),
              child: OtherPlaces(
                stateName: 'widget.data!.exposicaoId',
                timestamp: 'widget.data!.timestamp',
              ),
            )
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
                      'https://static.wixstatic.com/media/01f721_05e181101ac74cad9380f36e50cf32cc~mv2.jpg/v1/fit/w_2500,h_1330,al_c/01f721_05e181101ac74cad9380f36e50cf32cc~mv2.jpg'),
              CustomCacheImage(
                  imageUrl:
                      'https://visite.museus.gov.br/wp-content/uploads/tainacan-items/14/242116/Expo-Barro-Pele-Pedra-Grafite-Rio-2023-Fonte-Museu-das-Mulheres.jpg'),
              // CustomCacheImage(imageUrl: widget.data!.imageUrl3),
            ]),
      ),
    );
  }
}
