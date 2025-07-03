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
// import 'package:provider/provider.dart';
// import 'package:travel_hour/widgets/todo.dart';
import 'package:easy_localization/easy_localization.dart';

class Curatorial extends StatefulWidget {
  // final ItemModel? data;
  // final String? tag;

  const Curatorial({Key? key}) : super(key: key);
  // : super(key: key);

  @override
  _CuratorialState createState() => _CuratorialState();
}

class _CuratorialState extends State {
  // final String collectionName = 'places';
  final Uri _url =
      Uri.parse('https://ingressos.ccbb.com.br/cidades/sao-paulo-sp');

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
                // Hero(
                //   tag: 'Ingressos',
                //   child: ImageCarousel(),
                // ),
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
                  Text(
                      'A exposição Vetores-Vertentes: Fotógrafas do Pará, projeto do Museu das Mulheres, acontece sob a luz do feminino amazônico que se autoilumina de produção fotográfica na região Norte há mais de quatro décadas. Com um recorte curatorial decolonial pautado na pluralidade da visualidade amazônica - tradicional, híbrida e experimental -, exibimos cerca de 170 obras, somando fotografias, jornais de arte, propostas fotográficas, áudios e vídeos. Pela primeira vez reunidas em uma exposição coletiva, três gerações de fotógrafas estão presentes: Bárbara Freire, Cláudia Leão, Leila Jinkings, Paula Sampaio e Walda Marques, seguidas de Evna Moura, Nay Jinkings, Nailana Thiely e Renata Aguiar. Por sua vez, Deia Lima e Jacy Santos, da novíssima geração, confirmam a tradição fotográfica regional. \n\nEstas artistas apresentam em seus trabalhos os vetores e as vertentes identificados em uma produção entremeada pelo realce da realidade e o realismo fantástico, da fotografia de viagem pela Amazônia e pelo mundo à grafia de luz entre mulheres, religiosidades, naturezas e outras paisagens, além da experimentação fotográfica em diálogo com a arte contemporânea e o hibridismo amazônico. Expõe-se, sobretudo, a construção de uma autonomia artística, tanto na produção voltada para a invenção de novas imagens quanto para o registro documental sob influência da gênese da cultura amazônica e de identidades locais. \n\nPor dentro da floresta fotográfica que trouxemos para o CCBB, encontra-se o filme em realidade virtual “MUKATU’HARY”, que nos leva para o ritual de cura de Maputyra Guajajara, guardiã brasileira da cura ancestral. Aproveite a proteção que ela oferece nesta experiência de realidade expandida com imersão na musicalidade e na ritualidade indígenas. Os figurinos e artefatos utilizados no filme são exibidos aqui, aproximando nosso olhar do patrimônio feminino que compõe o acervo do museu.\n\n Apresentamos novas formas de fruição de obras com o entrelaçamento de tecnologia, mulheres e fotografias espalhadas pelo espaço arquitetônico, acessadas por meio da interatividade com realidade aumentada. A exposição reserva espaço especial para a Instalação “Icamiabas”, com composições aromáticas que promovem o encontro com a região Nhamundá, na Amazônia.\n\nDeclaro que uma única exposição para apresentar a dimensão histórica, poética e estética das fotografias artísticas de mulheres amazônicas nunca será suficiente - são muitas fotógrafas, são muitas artistas, são muitas mulheres: somos muitas. A história das mulheres na Amazônia não para. Seguiremos construindo nossos capítulos na fotografia brasileira, cuja visualidade regional-local é a maior riqueza imagética!',
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: -0.6,
                          wordSpacing: 1,
                          color: Colors.black)),
                  SizedBox(height: 16), // espaço vertical

                  Text(
                      'Sissa Aneleh \nCuradora \nHistoriadora da Arte\nDiretora do Museu das Mulheres'),

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
            // Padding(
            //   padding: const EdgeInsets.only(
            //       top: 20, bottom: 40, left: 20, right: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       ElevatedButton(
            //         onPressed: _launchUrl,
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: Colors.grey[100],
            //           foregroundColor: Colors.white,
            //           padding:
            //               EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //         ),
            //         child: Text(
            //           'sections.click_to_buy_ticket'.tr(),
            //           style: TextStyle(
            //             fontSize: 16,
            //             color: Colors.black,
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // // Padding(
            //   padding: EdgeInsets.all(20),
            //   child: TodoWidget(placeData: widget.data),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: 20, right: 0, bottom: 40),
            //   child: OtherPlaces(
            //     stateName: 'widget.data!.exposicaoId',
            //     timestamp: 'widget.data!.timestamp',
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'https://static.wixstatic.com/media/01f721_05e181101ac74cad9380f36e50cf32cc~mv2.jpg/v1/fit/w_2500,h_1330,al_c/01f721_05e181101ac74cad9380f36e50cf32cc~mv2.jpg',
    'https://visite.museus.gov.br/wp-content/uploads/tainacan-items/14/242116/Expo-Barro-Pele-Pedra-Grafite-Rio-2023-Fonte-Museu-das-Mulheres.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        final nextPage = (_currentPage + 1) % images.length;
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _startAutoPlay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      color: Colors.white,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return CustomCacheImage(imageUrl: images[index]);
            },
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
