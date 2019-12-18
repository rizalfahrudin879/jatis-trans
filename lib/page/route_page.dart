import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';

class RoutePage extends StatefulWidget {
  final String dariId;
  final String keId;
  final String date;
  RoutePage({this.dariId, this.keId, this.date});

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  List data;
  getData() {
    UserRepository()
        .searchRoute(
      dariId: widget.dariId,
      keId: widget.keId,
      date: widget.date,
    )
        .then((e) {
      setState(() {
        data = e;
      });
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  // return new Container(
  //             child: Card(
  //                 child: Text(
  //                     '${data[i]['dari_id']} - ${data[i]['ke_id']}-  ${data[i]['class_name']} - ${data[i]['price']} - ${data[i]['time_dari']}')));
  //       }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data == null ? Center(child: CircularProgressIndicator(),) :(data.isEmpty)
          ? Center(
              child: Text('route tidak tersedia, silahkan memilih route lain'),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Container(
                  child: Card(
                      child: Text(
                          '${data[i]['dari_id']} - ${data[i]['ke_id']}-  ${data[i]['class_name']} - ${data[i]['price']} - ${data[i]['time_dari']}')),
                );
              }),
    );
  }
}

// class ItemList extends StatelessWidget {
//   final List list;
//   ItemList({this.list});

//   @override
//   Widget build(BuildContext context) {
//     return new ListView.builder(
//       itemCount: list == null ? 0 : list.length,
//       itemBuilder: (context, i) {
//         return new Container(
//           padding: const EdgeInsets.only(right: 5, left: 5),
//           child: new GestureDetector(
//             onTap: () {
//               //'${list[i]['city_name']} - ${list[i]['pool_name']} '
//               Navigator.pop(
//                 context,
//                 '${list[i]['city_name']} - ${list[i]['dari_id']}',
//               );
//             },
//             child: Card(
//               child: new ListTile(
//                 title: new Text('${list[i]['dari_id']} - ${list[i]['ke_id']} '),
//                 leading: Icon(
//                   Icons.location_city,
//                   color: Colors.blue[900],
//                 ),
//                 // leading: new Icon(Icons.account_circle,color: Colors.deepPurple,),
//                 // subtitle: new Text("Alamat: ${list[i]['alamat']}"),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
