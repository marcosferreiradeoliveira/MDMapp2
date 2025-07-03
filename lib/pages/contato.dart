import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50), // Botão largo
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
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

  final _focusNode = FocusNode(); // Para gerenciar o foco

  @override
  void dispose() {
    _focusNode.dispose();
    _nomeController.dispose();
    _emailController.dispose();
    _mensagemController.dispose();
    super.dispose();
  }

  Future<void> _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _enviando = true;
      });

      final url = Uri.parse('https://formspree.io/f/mvgkpaqr');
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
        // Mostrar um diálogo de sucesso
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Sucesso!'),
            content: Text('Sua mensagem foi enviada com sucesso.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _formKey.currentState!.reset();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao enviar mensagem. Tente novamente.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato'),
        // Usando o botão de voltar personalizado
        leading: BackButtonWidget(),
      ),
      // Usando resizeToAvoidBottomInset para que o conteúdo se ajuste quando o teclado aparecer
      resizeToAvoidBottomInset: true,
      // Usando SingleChildScrollView para garantir que o conteúdo possa ser rolado quando o teclado estiver visível
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título para maior clareza
              Text(
                'Envie sua mensagem',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),

              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nome', style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _nomeController,
                      decoration: InputDecoration(
                        hintText: 'Digite seu nome completo',
                        prefixIcon: Icon(Icons.person),
                      ),
                      textInputAction:
                          TextInputAction.next, // Vai para o próximo campo
                      validator: (value) =>
                          value!.isEmpty ? 'Informe seu nome' : null,
                    ),
                    SizedBox(height: 16),

                    Text('E-mail',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'exemplo@email.com',
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction:
                          TextInputAction.next, // Vai para o próximo campo
                      validator: (value) =>
                          value!.contains('@') ? null : 'E-mail inválido',
                    ),
                    SizedBox(height: 16),

                    Text('Mensagem',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _mensagemController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: 'Digite sua mensagem aqui...',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        // Adicionando um botão de enviar diretamente no campo
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send,
                              color: Theme.of(context).primaryColor),
                          onPressed: _enviando ? null : _enviarFormulario,
                        ),
                      ),
                      maxLines: 5, // Aumentando para melhor visualização
                      textInputAction: TextInputAction.done, // Fecha o teclado
                      validator: (value) =>
                          value!.isEmpty ? 'Escreva uma mensagem' : null,
                    ),
                    SizedBox(height: 24),

                    // Botão grande e destacado
                    _enviando
                        ? Center(child: CircularProgressIndicator())
                        : ElevatedButton.icon(
                            onPressed: _enviarFormulario,
                            icon: Icon(Icons.send),
                            label: Text(
                              'ENVIAR MENSAGEM',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 24),
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(height: 36),

              // Links de política agora em linha com ícones
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse(
                          'https://www.museudasmulheres.com.br/pol%C3%ADtica-de-privacidade'));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.description, size: 16),
                        SizedBox(width: 4),
                        Text('Termos de Uso'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse(
                          'https://www.museudasmulheres.com.br/pol%C3%ADtica-de-privacidade'));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.privacy_tip, size: 16),
                        SizedBox(width: 4),
                        Text('Política de Privacidade'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse(
                          'https://www.museudasmulheres.com.br/pol%C3%ADtica-de-privacidade'));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.security, size: 16),
                        SizedBox(width: 4),
                        Text('LGPD'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Componente do botão de voltar personalizado
class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackButtonWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: onPressed ?? () => Navigator.of(context).pop(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
