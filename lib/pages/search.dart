// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:provider/provider.dart';
// import 'package:travel_hour/blocs/search_bloc.dart';
// import 'package:travel_hour/utils/empty.dart';
// import 'package:travel_hour/utils/list_card.dart';
// import 'package:travel_hour/utils/loading_cards.dart';
// import 'package:travel_hour/utils/snacbar.dart';
// import 'package:easy_localization/easy_localization.dart';

// class SearchPage extends StatefulWidget {
//   SearchPage({Key? key}) : super(key: key);

//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   var scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     Future.delayed(Duration()).then((value) => context.read<SearchBloc>().saerchInitialize());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         title: _searchBar(),
//         automaticallyImplyLeading: true,
//       ),
//       body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // suggestion text

//             Padding(
//               padding: const EdgeInsets.only(top: 15, left: 15, bottom: 5),
//               child: Text(
//                 context.watch<SearchBloc>().searchStarted == false
//                     ? 'recent searchs'
//                     : 'we have found',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                     color: Colors.grey[800],
//                     fontSize: 18,
//                     fontWeight: FontWeight.w700),
//               ).tr(),
//             ),
//             context.watch<SearchBloc>().searchStarted == false
//                 ? SuggestionsUI()
//                 : AfterSearchUI()
//           ],
//         ),
//     );
//   }

//   Widget _searchBar() {
//     return Container(
//       alignment: Alignment.center,
//       width: MediaQuery.of(context).size.width,
//       child: TextFormField(
//         autofocus: true,
//         controller: context.watch<SearchBloc>().textfieldCtrl,
//         style: TextStyle(fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w500),
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           hintText: "search & explore".tr(),
//           hintStyle: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Colors.grey[800]),
//           suffixIcon: IconButton(
//             icon: Icon(
//               Icons.close,
//               color: Colors.grey[800],
//               size: 25,
//             ),
//             onPressed: () {
//               context.read<SearchBloc>().saerchInitialize();
//             },
//           ),
//         ),
//         textInputAction: TextInputAction.search,
//         onFieldSubmitted: (value) {
//           if (value == '') {
//             openSnacbar(scaffoldKey, 'Type something!');
//           } else {
//             context.read<SearchBloc>().setSearchText(value);
//             context.read<SearchBloc>().addToSearchList(value);
//           }
//         },
//       ),
//     );
//   }
// }

// class SuggestionsUI extends StatelessWidget {
//   const SuggestionsUI({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final sb = context.watch<SearchBloc>();
//     return Expanded(
//       child: sb.recentSearchData.isEmpty
//           ? EmptyPage(
//               icon: Feather.search,
//               message: 'search for places'.tr(),
//               message1: "search-description".tr(),
//             )
//           : ListView.builder(
//               itemCount: sb.recentSearchData.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(
//                     sb.recentSearchData[index],
//                     style: TextStyle(fontSize: 17),
//                   ),
//                   leading: Icon(CupertinoIcons.time_solid),
//                   trailing: IconButton(
//                     icon: Icon(Icons.close),
//                     onPressed: () {
//                       context
//                           .read<SearchBloc>()
//                           .removeFromSearchList(sb.recentSearchData[index]);
//                     },
//                   ),
//                   onTap: () {
//                     context
//                         .read<SearchBloc>()
//                         .setSearchText(sb.recentSearchData[index]);
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }

// class AfterSearchUI extends StatelessWidget {
//   const AfterSearchUI({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: FutureBuilder(
//         future: context.watch<SearchBloc>().getData(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             if (snapshot.data.length == 0)
//               return EmptyPage(
//                 icon: Feather.clipboard,
//                 message: 'no places found'.tr(),
//                 message1: "try again".tr(),
//               );
//             else
//               return ListView.separated(
//                 padding: EdgeInsets.all(10),
//                 itemCount: snapshot.data.length,
//                 separatorBuilder: (context, index) => SizedBox(
//                   height: 5,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListCard(
//                     d: snapshot.data[index],
//                     tag: "search$index",
//                     color: Colors.white,
//                   );
//                 },
//               );
//           }
//           return ListView.separated(
//             padding: EdgeInsets.all(15),
//             itemCount: 5,
//             separatorBuilder: (BuildContext context, int index) => SizedBox(
//               height: 10,
//             ),
//             itemBuilder: (BuildContext context, int index) {
//               return LoadingCard(height: 120);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
