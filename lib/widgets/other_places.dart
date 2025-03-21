import 'package:flutter/material.dart';
// import 'package:line_icons/line_icons.dart';
import 'package:travel_hour/blocs/other_places_bloc.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/models/item.dart';
import 'package:travel_hour/pages/item_details.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'custom_cache_image.dart';
import 'package:easy_localization/easy_localization.dart';

class OtherPlaces extends StatefulWidget {
  final String? stateName;
  final String? timestamp;
  OtherPlaces({Key? key, required this.stateName, required this.timestamp})
      : super(key: key);

  @override
  _OtherPlacesState createState() => _OtherPlacesState();
}

class _OtherPlacesState extends State<OtherPlaces> {
  @override
  void initState() {
    super.initState();
    context.read<OtherPlacesBloc>().getData(widget.stateName, widget.timestamp);
  }

  @override
  Widget build(BuildContext context) {
    final ob = context.watch<OtherPlacesBloc>();

    if (ob.data.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 0,
            top: 10,
          ),
          child: Text(
            'you may also like',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ).tr(),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, bottom: 8),
          height: 3,
          width: 100,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(40)),
        ),
        Container(
          height: 240,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15, top: 5),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: ob.data.length,
            itemBuilder: (BuildContext context, int index) {
              return _ItemList(
                d: ob.data[index],
              );
            },
          ),
        )
      ],
    );
  }
}

class _ItemList extends StatelessWidget {
  final ItemModel d;
  const _ItemList({Key? key, required this.d}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 0, right: 10, top: 5, bottom: 5),
        width: MediaQuery.of(context).size.width * 0.38,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomCacheImage(imageUrl: d.imagem)),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                child: Text(
                  d.titulo!,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    right: 15,
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[600]!.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon(LineIcons.heart, size: 16, color: Colors.white),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        // Text(
                        //   d.loves.toString(),
                        //   style: TextStyle(fontSize: 12, color: Colors.white),
                        // )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
      onTap: () => nextScreenReplace(context, ItemDetails(data: d, tag: null)),
    );
  }
}
