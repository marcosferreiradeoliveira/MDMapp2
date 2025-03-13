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
import 'package:easy_localization/easy_localization.dart';

class Ingressos extends StatefulWidget {
  // final ItemModel? data;
  // final String? tag;

  const Ingressos({Key? key}) : super(key: key);
  // : super(key: key);

  @override
  _IngressosState createState() => _IngressosState();
}

class _IngressosState extends State {
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
                Hero(
                  tag: 'Ingressos',
                  child: ImageCarousel(),
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
                  Text('tickets'.tr(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.6,
                          wordSpacing: 1,
                          color: Colors.black)),
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
                  top: 20, bottom: 40, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _launchUrl,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: Text(
                      'click_to_buy_ticket'.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Padding(
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
