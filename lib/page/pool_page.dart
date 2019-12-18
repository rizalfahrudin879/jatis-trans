
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';

class Pool extends StatefulWidget {
  @override
  _PoolState createState() => _PoolState();
}

class _PoolState extends State<Pool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Center(
          child: Card(
            child: TextFormField(
              onChanged: (String value) {
                // getSearchPool(value);
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search"),
            ),
          ),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: data == null ? 0 : data.length,
      //   itemBuilder: (context, i) {
      //     return new Container(
      //       padding: const EdgeInsets.only(right: 5, left: 5),
      //       child: new GestureDetector(
      //         onTap: () {
      //           Navigator.pop(context,
      //               '${data[i]['city_name']} - ${data[i]['pool_name']} ');
      //         },
      //         child: Card(
      //           child: new ListTile(
      //             title: new Text(
      //                 '${data[i]['city_name']} - ${data[i]['pool_name']} '),
      //             leading: Icon(
      //               Icons.location_city,
      //               color: Colors.blue[900],
      //             ),
      //             // leading: new Icon(Icons.account_circle,color: Colors.deepPurple,),
      //             // subtitle: new Text("Alamat: ${list[i]['alamat']}"),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // )
      body: FutureBuilder<List>(
        future: UserRepository().getPool(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.only(right: 5, left: 5),
          child: new GestureDetector(
            onTap: () {
              //'${list[i]['city_name']} - ${list[i]['pool_name']} '
              Navigator.pop(context,
                  list[i]);
            },
            child: Card(
              child: new ListTile(
                title: new Text(
                    '${list[i]['city_name']} - ${list[i]['pool_name']} - ${list[i]['pool_id']}'),
                leading: Icon(
                  Icons.location_city,
                  color: Colors.blue[900],
                ),
                // leading: new Icon(Icons.account_circle,color: Colors.deepPurple,),
                // subtitle: new Text("Alamat: ${list[i]['alamat']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
