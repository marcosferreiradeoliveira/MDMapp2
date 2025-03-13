import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travel_hour/models/item.dart';
import 'package:travel_hour/pages/item_details.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/widgets/custom_cache_image.dart';
import 'package:travel_hour/widgets/html_body.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:travel_hour/widgets/youtube_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';

final player = AudioPlayer();

class ExposicaoDetails extends StatefulWidget {
  final String? titulo;
  final String? titulo_en;
  final String? subtitulo;
  final String? subtitulo_en;
  final String? descricao;
  final String? descricao_en;
  final String? exposicaoId;
  final String? curador;
  final String? url_libras;
  final String? url_audiodescricao;
  final Timestamp? data_inicio;
  final Timestamp? data_fim;
  final String? thumbnail;
  final Color? color;

  const ExposicaoDetails({
    Key? key,
    this.titulo,
    this.titulo_en,
    this.subtitulo,
    this.subtitulo_en,
    this.descricao,
    this.descricao_en,
    this.exposicaoId,
    this.curador,
    this.url_libras,
    this.url_audiodescricao,
    this.data_inicio,
    this.data_fim,
    this.thumbnail,
    this.color,
  }) : super(key: key);

  @override
  State<ExposicaoDetails> createState() => _ExposicaoDetailsState();
}

class _ExposicaoDetailsState extends State<ExposicaoDetails> {
  bool _isLoading = true;
  bool _hasData = false;
  List<DocumentSnapshot> _snap = [];
  List<ItemModel> _data = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _showAudioPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AudioPopup(audioUrl: widget.url_audiodescricao ?? '');
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
              url: widget.url_libras ?? '',
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('exposicoes'.tr()),
        backgroundColor: Colors.grey[200],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                widget.color == null
                    ? _slidableImages()
                    : Hero(
                        tag: widget.color!,
                        child: _slidableImages(),
                      ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 8, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    context.locale.languageCode == 'en'
                        ? (widget.titulo_en ?? widget.titulo!)
                        : widget.titulo!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.6,
                      wordSpacing: 1,
                      color: Colors.grey[800],
                    ),
                  ),
                  if (context.locale.languageCode == 'en'
                      ? widget.subtitulo_en != null
                      : widget.subtitulo != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        context.locale.languageCode == 'en'
                            ? widget.subtitulo_en!
                            : widget.subtitulo!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          _showYoutubePopup(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 215, 215, 215),
                          foregroundColor: Colors.black,
                        ),
                        icon: Icon(Icons.sign_language),
                        label: Text('libras'.tr()),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _showAudioPopup(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 215, 215, 215),
                          foregroundColor: Colors.black,
                        ),
                        icon: Icon(Icons.hearing),
                        label: Text('audiodescricao'.tr()),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 8),
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
                  top: 10, bottom: 8, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HtmlBodyWidget(
                    content: context.locale.languageCode == 'en'
                        ? (widget.descricao_en ?? widget.descricao).toString()
                        : widget.descricao.toString(),
                    isIframeVideoEnabled: true,
                    isVideoEnabled: true,
                    isimageEnabled: true,
                    fontSize: null,
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
              height: 40,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 8, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Obras",
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
                ],
              ),
            ),
            SizedBox(height: 20),
            if (_isLoading) Center(child: CircularProgressIndicator()),
            if (!_isLoading && !_hasData)
              Center(child: Text('Nenhum item encontrado')),
            if (!_isLoading && _hasData)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  final item = _data[index];

                  return Card(
                    margin: EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      title: Text(context.locale.languageCode == 'en'
                          ? (item.titulo_en ?? item.titulo ?? 'No title')
                          : (item.titulo ?? 'Sem título')),
                      subtitle: Text(context.locale.languageCode == 'en'
                          ? (item.descricao_en ??
                              item.descricao ??
                              'No description')
                          : (item.descricao ?? 'Sem descrição')),
                      leading: item.imagem != null
                          ? Image.network(
                              item.imagem!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.image),
                      onTap: () => nextScreen(
                          context,
                          ItemDetails(
                              data: item,
                              tag: 'recent${item.timestamp ?? ''}')),
                    ),
                  );
                },
              ),
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
                      'https://www.aen.pr.gov.br/sites/default/arquivos_restritos/files/imagem/2023-02/exposicao_fora_das_sombras_1._credito_marcello_kawase.jpg'),
            ]),
      ),
    );
  }

  Future<Null> _getData() async {
    QuerySnapshot data;
    if (_isLoading) {
      data = await FirebaseFirestore.instance.collection('Item').get();

      if (data.docs.length > 0) {
        setState(() {
          _snap.addAll(data.docs);
          _data = _snap.map((e) => ItemModel.fromFirestore(e)).toList();
          _isLoading = false;
          _hasData = true;
        });
      } else {
        setState(() {
          _isLoading = false;
          _hasData = false;
        });
      }
    }
    return null;
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
