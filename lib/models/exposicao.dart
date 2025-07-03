import 'package:cloud_firestore/cloud_firestore.dart';

class ExposicaoModel {
  String? titulo;
  String? titulo_en;
  String? subtitulo;
  String? subtitulo_en;
  String? descricao;
  String? descricao_en;
  String? exposicaoId;
  String? curador;
  String? url_libras;
  String? url_audiodescricao;
  Timestamp? data_inicio;
  Timestamp? data_fim;
  String? timestamp;
  String? thumbnail;

  ExposicaoModel({
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
    this.timestamp,
    this.thumbnail,
  });

  factory ExposicaoModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> d = snapshot.data() as Map<String, dynamic>;
    return ExposicaoModel(
      titulo: d['titulo'],
      titulo_en: d['titulo_en'],
      subtitulo: d['subtitulo'],
      subtitulo_en: d['subtitulo_en'],
      descricao: d['descricao'],
      descricao_en: d['descricao_en'],
      exposicaoId: snapshot.id, // Use sempre o id do documento
      curador: d['curador'],
      url_libras: d['url_libras'],
      url_audiodescricao: d['url_audiodescricao'],
      data_inicio: d['data_inicio'],
      data_fim: d['data_fim'],
      timestamp: d['timestamp'],
      thumbnail: d['thumbnail'],
    );
  }
}
