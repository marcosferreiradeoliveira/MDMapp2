import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_icons/line_icons.dart';
// import 'package:travel_hour/blocs/ads_bloc.dart';
// import 'package:travel_hour/blocs/bookmark_bloc.dart';
// import 'package:travel_hour/blocs/sign_in_bloc.dart';
import 'package:travel_hour/models/item.dart';
// import 'package:travel_hour/utils/sign_in_dialog.dart';
// import 'package:travel_hour/widgets/bookmark_icon.dart';
// import 'package:travel_hour/widgets/comment_count.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
// import 'package:travel_hour/widgets/love_count.dart';
// import 'package:travel_hour/widgets/love_icon.dart';
import 'package:travel_hour/widgets/other_places.dart';
// import 'package:provider/provider.dart';
// import 'package:travel_hour/widgets/todo.dart';
import '../widgets/html_body.dart';
// import 'package:flutter_youtube/flutter_youtube.dart';
// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:travel_hour/widgets/youtube_player.dart';
import 'package:audioplayers/audioplayers.dart';

class ItemDetails extends StatefulWidget {
  final ItemModel? data;
  final String? tag;

  const ItemDetails({Key? key, required this.data, required this.tag})
      : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  final String collectionName = 'places';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((value) async {
      // context.read<AdsBloc>().initiateAds();
    });
  }

  void _showAudioPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AudioPopup(audioUrl: widget.data!.url_audiodescricao ?? '');
      },
    );
  }

  void _showYoutubePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.5,
            child: YoutubePlayerDemoApp(
              url: widget.data!.url_libras ?? '',
            ),
          ),
        );
      },
    );
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
    // final SignInBloc sb = context.watch<SignInBloc>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                widget.tag == null
                    ? _slidableImages()
                    : Hero(
                        tag: widget.tag!,
                        child: _slidableImages(),
                      ),
                Positioned(
                  top: 20,
                  left: 15,
                  child: SafeArea(
                    child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.9),
                      child: IconButton(
                        icon: Icon(
                          LineIcons.arrowLeft,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
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
                  Text(widget.data!.titulo!,
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
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showYoutubePopup(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 215, 215, 215),
                        foregroundColor: Colors.black),
                    child: Text('Libras'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _showAudioPopup(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 215, 215, 215),
                        foregroundColor: Colors.black),
                    child: Text('Áudiodescrição'),
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
                  HtmlBodyWidget(
                    content: widget.data!.descricao.toString(),
                    isIframeVideoEnabled: true,
                    isVideoEnabled: true,
                    isimageEnabled: true,
                    fontSize: null,
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
                stateName: widget.data!.exposicaoId,
                timestamp: widget.data!.timestamp,
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
              CustomCacheImage(imageUrl: widget.data!.imagem),
              // CustomCacheImage(imageUrl: widget.data!.imageUrl2),
              // CustomCacheImage(imageUrl: widget.data!.imageUrl3),
            ]),
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
          'https://firebasestorage.googleapis.com/v0/b/museu-das-mulheres---app.firebasestorage.app/o/audiodescricao%2FElevenLabs_2025-02-25T16_22_35_Chris_pre_s50_sb75_se0_b_m2.mp3?alt=media&token=d86b05a3-141d-4af8-b9ef-986c18f9a0e3'));
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
