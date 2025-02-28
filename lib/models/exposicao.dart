import 'package:cloud_firestore/cloud_firestore.dart';

class ExposicaoModel {
  String? name;
  String? titulo_en;
  String? thumbnail;
  String? descricao;
  String? descricao_en;
  String? timestamp;
  String? curador;
  String? subtitulo;
  String? subtitulo_en;
  String? url_libras;
  String? exposicaoId;
  String? url_audiodescricao;
  DateTime? data_inicio;
  DateTime? data_fim;

  ExposicaoModel({
    this.name,
    this.titulo_en,
    this.thumbnail,
    this.descricao,
    this.descricao_en,
    this.timestamp,
    this.curador,
    this.subtitulo,
    this.subtitulo_en,
    this.url_libras,
    this.url_audiodescricao,
    this.data_inicio,
    this.data_fim,
    this.exposicaoId,
  });

  factory ExposicaoModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> d = snapshot.data() as Map<String, dynamic>;
    return ExposicaoModel(
      name: d['name'],
      titulo_en: d['titulo_en'],
      thumbnail: d['thumbnail'],
      descricao: d['descricao'],
      descricao_en: d['descricao_en'],
      timestamp: d['timestamp'],
      curador: d['curador'],
      subtitulo: d['subtitulo'],
      subtitulo_en: d['subtitulo_en'],
      url_libras: d['url_libras'],
      url_audiodescricao: d['url_audiodescricao'],
      data_inicio: (d['data_inicio'] != null)
          ? (d['data_inicio'] as Timestamp).toDate()
          : null,
      data_fim: (d['data_fim'] != null)
          ? (d['data_fim'] as Timestamp).toDate()
          : null,
      exposicaoId: d['exposicaoId'],
    );
  }
}
