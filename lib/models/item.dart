import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String? exposicaoId;
  String? titulo;
  String? titulo_en;
  String? imagem;
  String? descricao;
  String? descricao_en;
  String? url_libras;
  String? url_audiodescricao;
  String? timestamp;
  String? date;

  ItemModel({
    this.exposicaoId,
    this.titulo,
    this.titulo_en,
    this.imagem,
    this.descricao,
    this.descricao_en,
    this.url_libras,
    this.url_audiodescricao,
    this.timestamp,
    this.date,
  });

  factory ItemModel.fromMap(Map<String, dynamic> data) {
    return ItemModel(
      exposicaoId: data['exposicaoId'],
      titulo: data['titulo'],
      titulo_en: data['titulo_en'],
      imagem: data['imagem'],
      descricao: data['descricao'],
      descricao_en: data['descricao_en'],
      url_libras: data['url_libras'],
      url_audiodescricao: data['url_audiodescricao'],
      timestamp: data['timestamp'],
      date: data['date'],
    );
  }

  factory ItemModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ItemModel(
      exposicaoId: data['exposicaoId'],
      titulo: data['titulo'],
      titulo_en: data['titulo_en'],
      imagem: data['imagem'],
      descricao: data['descricao'],
      descricao_en: data['descricao_en'],
      url_libras: data['url_libras'],
      url_audiodescricao: data['url_audiodescricao'],
      timestamp: data['timestamp'],
      date: data['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'exposicaoId': exposicaoId,
      'titulo': titulo,
      'titulo_en': titulo_en,
      'imagem': imagem,
      'descricao': descricao,
      'descricao_en': descricao_en,
      'url_libras': url_libras,
      'url_audiodescricao': url_audiodescricao,
      'timestamp': timestamp,
      'date': date,
    };
  }
}
