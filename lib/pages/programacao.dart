import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Programacao extends StatelessWidget {
  const Programacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            child: Image.network(
              'https://static.wixstatic.com/media/01f721_05e181101ac74cad9380f36e50cf32cc~mv2.jpg/v1/fit/w_2500,h_1330,al_c/01f721_05e181101ac74cad9380f36e50cf32cc~mv2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 8, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.locale.languageCode == 'en'
                              ? 'Schedule'
                              : 'Programação',
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
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.locale.languageCode == 'en'
                              ? 'On March 8th, International Women\'s Day and the exhibition\'s opening date, the public can enjoy a special program.'
                              : 'Em 8 de março, Dia Internacional da Mulher e data de abertura da exposição, o público poderá conferir uma programação especial.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          context.locale.languageCode == 'en'
                              ? 'Chat: the exhibition will be open from 9am to 8pm, and at 11am, in the Cinema, there will be a chat with artists Evna Moura, Renata Aguiar, and Leila Jinkings, moderated by curator Sissa Aneleh.'
                              : 'Bate-papo: a mostra estará aberta das 9h às 20h, e às 11h, no Cinema, acontece um bate-papo com as artistas Evna Moura, Renata Aguiar e Leila Jinkings, sob a mediação da curadora Sissa Aneleh.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          context.locale.languageCode == 'en'
                              ? 'Presentation: in the afternoon, at 2pm, there will be the presentation Sound on Scene: Amazonian Enchantments, a sound experience, conducted by CCBB Educativo, which extends until 2:25pm at the Mezzanine.'
                              : 'Apresentação: no período da tarde, às 14h, haverá a apresentação Som em Cena: Encantarias Amazônidas, uma experiência sonora, realizada pelo CCBB Educativo, que se estende até 14h25 no Mezanino.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          context.locale.languageCode == 'en'
                              ? 'Show: closing the day\'s program, the show Vertentes: Rhythms of Pará, with Ellie Valente and Liége, happens from 4pm to 5:30pm, also at the Mezzanine, bringing the musical richness of the region in a vibrant celebration of Amazonian culture.'
                              : 'Show: encerrando a programação do dia, o show Vertentes: Ritmos do Pará, com Ellie Valente e Liége, acontece das 16h às 17h30, também no Mezanino, trazendo a riqueza musical da região em uma celebração vibrante da cultura amazônica.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
