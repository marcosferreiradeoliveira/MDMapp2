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
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();

class Institucional extends StatefulWidget {
  // final ItemModel? data;
  // final String? tag;

  const Institucional({Key? key}) : super(key: key);
  // : super(key: key);

  @override
  _InstitucionalState createState() => _InstitucionalState();
}

void _showAudioPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AudioPopup(
          audioUrl:
              'https://firebasestorage.googleapis.com/v0/b/museu-das-mulheres---app.firebasestorage.app/o/audiodescricao%2FInstitucional_CCBB_QRCODE01.mp3?alt=media&token=e519f93b-b863-47e2-9617-a02a17034292' ??
                  '');
    },
  );
}

class _InstitucionalState extends State {
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
                      'O Banco do Brasil apresenta e patrocina a exposição Vetores-Vertentes: Fotógrafas do Pará, com obras que retratam potentes expressões visuais produzidas por mulheres da Amazônia. \n\n Com curadoria de Sissa Aneleh, a mostra propõe uma experiência imersiva que transita entre a experimentação artística e a documentação social, por meio de fotografias, foto-objetos, instalações fotográficas, vídeos, fotonovelas, jornais fotográficos e áudio, construídos por 11 fotógrafas, ao longo de mais de 40 anos de produção.\n\nA exposição é um convite para a reflexão sobre a identidade, a memória e o território da região, destacando a importância da representatividade e da autonomia das mulheres na construção de narrativas visuais que traduzem a riqueza cultural e social da Amazônia.\n\nA seleção desse projeto, por meio do Edital de Patrocínios, demonstra o compromisso do Banco do Brasil em promover a equidade de gênero, fortalecer as expressões artísticas regionais, além de enriquecer o cenário cultural brasileiro.\n\nO Centro Cultural Banco do Brasil, ao realizar essa exposição, fortalece a conexão dos brasileiros com a cultura, contribui para dar visibilidade a produções artísticas que ampliam o olhar sobre a diversidade cultural do país e materializa iniciativas que reconhecem o papel das mulheres na construção de nossa identidade.',
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: -0.6,
                          wordSpacing: 1,
                          color: Colors.black)),
                  SizedBox(height: 16),

                  ElevatedButton.icon(
                    onPressed: () {
                      _showAudioPopup(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 215, 215, 215),
                      foregroundColor: Colors.black,
                    ),
                    icon: Icon(Icons.hearing),
                    label: Text('audiodescricao'.tr()),
                  ),

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

class AudioPopup extends StatefulWidget {
  final String audioUrl;

  const AudioPopup({Key? key, required this.audioUrl}) : super(key: key);

  @override
  _AudioPopupState createState() => _AudioPopupState();
}

class _AudioPopupState extends State<AudioPopup> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void togglePlayPause() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.play(UrlSource(
          'https://firebasestorage.googleapis.com/v0/b/museu-das-mulheres---app.firebasestorage.app/o/audiodescricao%2FInstitucional_CCBB_QRCODE01.mp3?alt=media&token=e519f93b-b863-47e2-9617-a02a17034292'));
    }
  }

  void seekTo(double value) async {
    await player.seek(Duration(seconds: value.toInt()));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 40,
              ),
              onPressed: togglePlayPause,
            ),
            SizedBox(height: 20),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: seekTo,
            ),
            Text(
              '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / '
              '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Fechar'),
        ),
      ],
    );
  }
}
