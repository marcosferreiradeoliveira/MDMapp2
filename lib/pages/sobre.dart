import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
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

class Sobre extends StatefulWidget {
  // final ItemModel? data;
  // final String? tag;

  const Sobre({Key? key}) : super(key: key);
  // : super(key: key);

  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State {
  // final String collectionName = 'places';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  // Hero(
                  //   tag: 'Sobre',
                  //   child: _slidableImages(),
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 8, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      context.locale.languageCode == 'en' ? 'About' : 'Sobre',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.6,
                        wordSpacing: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      height: 3,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
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
                      context.locale.languageCode == 'en'
                          ? 'The Women\'s Museum, Museum DAS, is the first Brazilian museum dedicated to women. It is a private museum with public, social, and cultural purposes. Founded on February 10, 2022, the museum was born from the desire to recognize the value of women\'s art production in Brazil and worldwide. Therefore, it aims to be a place of appreciation, dialogue, unity, love, equity, welcoming, and peace culture between women and other segments of society who want to join forces to promote the advancement of adult women, young women, and children.'
                          : 'A exposição Vetores-Vertentes: Fotógrafas do Pará é uma exposição com itinerância nacional contemplando todas as unidades do Centro Cultural Banco do Brasil. Com patrocínio do Banco do Brasil, temos a oportunidade de ofertar este grande projeto de forma gratuita e com classificação livre. \n\nA pesquisa mostrada na exposição contribui para a história da fotografia apresentando artistas da Amazônia Brasileira. A mostra reúne onze artistas e três gerações de mulheres reunidas pela primeira vez em exposição coletiva, com presença de representantes de mais de quarenta anos de produção fotográfica da região Norte do Brasil. Apresenta-se recorte curatorial decolonial pautado nas questões de gênero e regionalismo, exibindo-se 170 obras somando fotografias, fotonovelas, jornais artísticos, vídeos e áudios que demonstram estilos e temáticas predominantes desta produção feminina das décadas de 1980 a 2020. Além de apresentarmos seleção de fotos com os vetores locais identitários e com as vertentes fotográficas que geraram a tradição e a estética da fotografia artística feminina do Pará. \n\nA exposição oferece vivências afetivas e tecnologias emergentes, conduzindo os visitantes para experiência sensorial-espacial-aromática, imersão em realidade expandida (XR) pelo Filme o Mukatuhary apresentado em realidade virtual (VR) com temática feminina indígena e cenário ancestral, além de exibição de fotografias em realidade aumentada (AR) em diversos espaços do percurso expositivo. \n\nA cultura material, artística e visual amazônica e paraense perpassam pelas lentes das fotógrafas que versam seus vetores e vertentes na arte fotográfica tão especial do Brasil.\n\n\nDireção Artística e Curadoria de Sissa Aneleh. \n\n\n\nPROGRAMAÇÃO NO CENTRO CULTURAL BANCO DO BRASIL\nSP 08/03/25 - 05/05/25 \nBH 04/06/25 - 28/07/25 \nDF 26/08/25 - 26/10/25 \nRJ 11/02/26 - 27/04/26\n\n\n\nConfira a programação durante a itinerância por cidade no site www.ccbb.com.br\n\n✨Projeto com Patrocínio do Banco do Brasil, Ministério da Cultura via Lei de Incentivo à Cultura - Lei Rouanet e Governo Federal.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                      ),
                    ),
                    // SizedBox(height: 20),
                    // Text(
                    //   'Centro Cultural Banco do Brasil',
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.grey[800],
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 8, left: 20, right: 20),
                child: Container(
                  height: 100,
                  width: 400,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              SizedBox(height: 20), // Espaçamento
            ],
          ),
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
                      'https://firebasestorage.googleapis.com/v0/b/museu-das-mulheres---app.firebasestorage.app/o/Imagens%2FWhatsApp%20Image%202025-05-02%20at%2014.55.58.jpeg?alt=media&token=ce0c1765-6bc8-4455-a6ff-5e2941e0cfc5'),
              CustomCacheImage(
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/museu-das-mulheres---app.firebasestorage.app/o/Imagens%2FWhatsApp%20Image%202025-05-02%20at%2014.55.58.jpeg?alt=media&token=ce0c1765-6bc8-4455-a6ff-5e2941e0cfc5'),
              // CustomCacheImage(imageUrl: widget.data!.imageUrl3),
            ]),
      ),
    );
  }
}
