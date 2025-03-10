import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/recent_places_bloc.dart';
// import 'package:travel_hour/blocs/recommanded_places_bloc.dart';
// import 'package:travel_hour/blocs/sign_in_bloc.dart';
import 'package:travel_hour/config/config.dart';
// import 'package:travel_hour/widgets/popular_places.dart';
import 'package:travel_hour/widgets/recent_itens.dart';
// import 'package:travel_hour/widgets/recommended_places.dart';
import 'package:travel_hour/widgets/recent_blogs.dart';
import 'package:travel_hour/blocs/blog_bloc.dart';
import 'package:travel_hour/widgets/special_state1.dart';
import 'package:travel_hour/blocs/sp_state_one.dart';

class Explore extends StatefulWidget {
  Explore({Key? key}) : super(key: key);

  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    reloadData();
  }

  Future reloadData() async {
    Future.delayed(Duration(milliseconds: 0)).then((_) async {
      await context.read<ItensBloc>().getData();
      await context.read<BlogBloc>().getData(mounted, 'loves');
      await context.read<ExposicaoStateBloc>().getData();
      // .then((value) => context.read<SpecialStateTwoBloc>().getData());
      // .then((value) => context.read<RecommandedPlacesBloc>().getData());
    });
  }

  Future _onRefresh() async {
    // context.read<PopularPlacesBloc>().onRefresh(mounted);
    context.read<ItensBloc>().onRefresh(mounted);
    context.read<BlogBloc>().onRefresh(mounted, 'loves');
    context.read<ExposicaoStateBloc>().onRefresh(mounted);
    // context.read<SpecialStateTwoBloc>().onRefresh(mounted);
    // context.read<RecommandedPlacesBloc>().onRefresh(mounted);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async => _onRefresh(),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Header(),
                  // Featured(),
                  // PopularPlaces(),
                  ExposicaoState(),
                  Itens(),
                  RecentBlogs()
                  // ExposicaoState(),
                  // SpecialStateTwo(),
                  // RecommendedPlaces()
                ],
              ),
            ),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final SignInBloc sb = Provider.of<SignInBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Config().appName,
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Muli',
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[800]),
                    ),
                  ],
                ),
                Spacer(),
                // InkWell(
                //   child: sb.imageUrl == null || sb.isSignedIn == false
                //       ? Container(
                //           height: 50,
                //           width: 50,
                //           decoration: BoxDecoration(
                //             color: Colors.grey[300],
                //             shape: BoxShape.circle,
                //           ),
                //           child: Icon(Icons.person, size: 28),
                //         )
                //       : Container(
                //           height: 50,
                //           width: 50,
                //           decoration: BoxDecoration(
                //               color: Colors.grey[300],
                //               shape: BoxShape.circle,
                //               image: DecorationImage(
                //                   image:
                //                       CachedNetworkImageProvider(sb.imageUrl!),
                //                   fit: BoxFit.cover)),
                //         ),
                //   onTap: () {
                //     nextScreen(context, ProfilePage());
                //   },
                // )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // InkWell(
          //   child: Container(
          //     alignment: Alignment.centerLeft,
          //     margin: EdgeInsets.only(left: 5, right: 5),
          //     padding: EdgeInsets.only(left: 15, right: 15),
          //     height: 45,
          //     width: MediaQuery.of(context).size.width,
          //     decoration: BoxDecoration(
          //       color: Colors.grey[100],
          //       border: Border.all(color: Colors.grey[300]!, width: 0.5),
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(10),
          //       child: Row(
          //         children: <Widget>[
          //           Icon(
          //             Feather.search,
          //             color: Colors.grey[600],
          //             size: 20,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Text(
          //             'search places',
          //             style: TextStyle(
          //                 fontSize: 15,
          //                 color: Colors.blueGrey[700],
          //                 fontWeight: FontWeight.w500),
          //           ).tr(),
          //         ],
          //       ),
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => SearchPage()));
          //   },
          // )
        ],
      ),
    );
  }
}
