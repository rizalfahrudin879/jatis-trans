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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Pilih bus'),
        backgroundColor: Colors.orange[400],
      ),
      body: data == null ? Center(child: CircularProgressIndicator(),) :(data.isEmpty)
          ? Center(
              child: Text('route tidak tersedia, silahkan memilih route lain'),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.only(right: 5,left: 5),
                  child: GestureDetector(
                    onTap: (){},
                    child: Card(
                        child: ListTile(
                          leading: Image.asset('images/promo02.png'),
                            title: Center(child: Text('Jatis Trans',style: TextStyle(fontWeight: FontWeight.w700),)),

                            subtitle: Column(
                              children: <Widget>[
                                SizedBox(height: 10),
                                Text('${data[i]['class_name']}'),
                                Text('${data[i]['dari_id']}'),
                                Icon(Icons.arrow_downward),
                                Text('${data[i]['ke_id']}'),

                              ],
                            ),
                            trailing: Container(
                              child: Column(
                                children: <Widget>[

                                  Text('Rp.${data[i]['price']}',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w700),),
                                ],

                              ),
                            ),
                           // Text('Rp.${data[i]['price']}'),

                            //'${data[i]['dari_id']} - ${data[i]['ke_id']}-  ${data[i]['class_name']} - ${data[i]['price']} - ${data[i]['time_dari']}'
                        ),
                    ),
                  ),
                );
              }),
    );
  }
}
