import 'package:flutter/material.dart';
import 'package:travel_hour/blocs/sp_state_one.dart';
import 'package:travel_hour/models/colors.dart';
// import 'package:travel_hour/config/config.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/pages/exposicao_details.dart';
import 'package:travel_hour/utils/list_card.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class ExposicaoState extends StatelessWidget {
  ExposicaoState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spb = context.watch<ExposicaoStateBloc>();

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 15,
            top: 20,
            right: 15,
          ),
          child: Row(
            children: <Widget>[
              Text(
                'Exposição',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[800],
                    wordSpacing: 1,
                    letterSpacing: -0.6),
              ).tr(),
              Spacer(),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () => nextScreen(
                    context,
                    ExposicaoDetails(
                      name: spb.data[0].name,
                      color: (ColorList().randomColors..shuffle()).first,
                      exposicaoId: spb.data[0].exposicaoId,
                      descricao: spb.data[0].descricao,
                      descricao_en: spb.data[0].descricao_en,
                      curador: spb.data[0].curador,
                      subtitulo: spb.data[0].subtitulo,
                      subtitulo_en: spb.data[0].subtitulo_en,
                      url_libras: spb.data[0].url_libras,
                      url_audiodescricao: spb.data[0].url_audiodescricao,
                      data_inicio: spb.data[0].data_inicio,
                    )),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10, right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: spb.data.isEmpty ? 4 : 1,
            itemBuilder: (BuildContext context, int index) {
              if (spb.data.isEmpty) return Container();
              return ListCard(
                d: spb.data[index],
                tag: 'sp1$index',
                color: Colors.grey[200],
              );
            },
          ),
        )
      ],
    );
  }
}
