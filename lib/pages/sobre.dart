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
                  Hero(
                    tag: 'Sobre',
                    child: _slidableImages(),
                  ),
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
                          : 'O Museu das Mulheres, Museu DAS, é o primeiro museu brasileiro dedicado às mulheres. Museu privado com finalidade pública, social e cultural. Fundado em 10 fevereiro de 2022, o museu nasceu da vontade de reconhecer o valor da produção de arte de mulheres no Brasil e no mundo. Para tanto, almeja ser um lugar de valorização, diálogo, união, amorosidade, equidade, acolhimento, cultura da paz entre mulheres e demais segmentos da sociedade que quiserem somar forças para promoção do avanço de mulheres adultas, jovens e crianças.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Espaçamento
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 8, left: 20, right: 20),
                child: Container(
                  height: 100,
                  width: 400,
                  child: Image.asset('assets/images/Logo.png'),
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
