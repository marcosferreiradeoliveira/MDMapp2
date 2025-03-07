import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Contato(),
  ));
}

class Contato extends StatefulWidget {
  @override
  _ContatoState createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _mensagemController = TextEditingController();
  bool _enviando = false;

  Future<void> _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _enviando = true;
      });

      final url = Uri.parse(
          'https://formspree.io/f/mvgkpaqr'); // Substitua pela sua URL do Formspree
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nome': _nomeController.text,
          'email': _emailController.text,
          'mensagem': _mensagemController.text,
        }),
      );

      setState(() {
        _enviando = false;
      });

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Mensagem enviada com sucesso!')));
        _formKey.currentState!.reset();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Erro ao enviar mensagem, tente novamente.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Contato')),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nomeController,
                      decoration: InputDecoration(labelText: 'Nome'),
                      validator: (value) =>
                          value!.isEmpty ? 'Informe seu nome' : null,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value!.contains('@') ? null : 'E-mail inválido',
                    ),
                    TextFormField(
                      controller: _mensagemController,
                      decoration: InputDecoration(labelText: 'Mensagem'),
                      maxLines: 4,
                      validator: (value) =>
                          value!.isEmpty ? 'Escreva uma mensagem' : null,
                    ),
                    SizedBox(height: 16),
                    _enviando
                        ? CircularProgressIndicator() // Indicador de carregamento
                        : ElevatedButton(
                            onPressed: _enviarFormulario,
                            child: Text('Enviar'),
                          ),
                  ],
                ),
              ),
              SizedBox(height: 36),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse('https://www.instagram.com/museudas/'));
                  },
                  child: Text('Termos de Uso'),
                ),
                SizedBox(height: 6),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse('https://www.instagram.com/museudas/'));
                  },
                  child: Text('Política de Privacidade'),
                ),
                SizedBox(height: 6),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse('https://www.instagram.com/museudas/'));
                  },
                  child: Text('Uso de Dados pela LGPD'),
                ),
              ]),
            ])));
  }
}
