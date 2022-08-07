// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'informationPool.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:http/http.dart' as http;

// class InformationHomepage extends StatefulWidget {
//   InformationHomepage({Key? key}) : super(key: key);

//   @override
//   _InformationHomepageState createState() => _InformationHomepageState();
// }

// class _InformationHomepageState extends State<InformationHomepage> {
//   var sessionManager = SessionManager(); //instantiate session

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Consumer<InformationPoolModel>(builder: buildScaffold);
//   }

//   Scaffold buildScaffold(
//       BuildContext context, InformationPoolModel informationpoolModel, _) {
//     // ignore: dead_code
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('InformationPool'),
//           centerTitle: true),

//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
             
//               //YOUR UI HERE
//                Expanded(
//                 child: ListView.builder(
//                   itemBuilder: (_, index) {
//                     //ignore: non_constant_identifier_names
//                     //var informationPool = InformationPoolModel.informationpoolItems[index];
//                     return ListTile(
//                       //title: Text(InformationPool.location),
//                      // subtitle: Text(InformationPool.date.toString()),
//                       //leading: Image.network(image),

//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                          // return InformationPollDetails(id: index);
//                         }));
//                       },
//                     );
//                   },
//                   //itemCount: InformationPoolModel.informationpoolItems.length
//                   ),
//             )
//             ],
//           ),
//         ),
//       ),
//   }
// }
// //A little helper widget to avoid runtime errors -- we can't just display a Text() by itself if not inside a MaterialApp, so this workaround does the job
// class FullScreenText extends StatelessWidget {
//   final String text;

//   const FullScreenText({Key? key, required this.text}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//         textDirection: TextDirection.ltr,
//         child: Column(children: [Expanded(child: Center(child: Text(text)))]));
//   }
// }

