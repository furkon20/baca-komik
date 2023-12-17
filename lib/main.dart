import 'dart:convert';
import 'package:buku/view_model/fectrekom.dart';
import 'package:flutter/material.dart';
import 'package:buku/home.dart';
import 'package:buku/view_model/fectrekom.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHome(),
    );
  }
}





























// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//     Future<List<dynamic>>? _fetchKomik;

//   @override
//   void initState() {
//     super.initState();
//     _fetchKomik = FetchApi.fetchKomikList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: FutureBuilder<List<dynamic>>(
//         future: _fetchKomik,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final komik = snapshot.data![index];
//                 return ListTile(
//                   title: Text(komik['title']),
//                   subtitle: Text(komik['latestChapter']),
//                   leading: Image.network(komik['cover']),
//                   onTap: () {
//                     // handle tap
//                   },
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('${snapshot.error}'),
//             );
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }
