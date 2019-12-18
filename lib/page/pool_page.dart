
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Pool extends StatefulWidget {
  @override
  _PoolState createState() => _PoolState();
}

class _PoolState extends State<Pool> {
  final TextEditingController _filter = new TextEditingController();

  List pool_name = new List();
  List filteredpool_name= new List();


  List list;
  Future getData() async {

    http.Response hasil = await http.get(
        Uri.encodeFull("http://adityo.xyz/jatis_trans/get_pool.php"),
        headers: {"Accept": "application/json"});

    //   await new Future.delayed(new Duration(seconds: 1));

    this.setState(() {
      list = json.decode(hasil.body);
    });
  }

  void initState() {
    super.initState();
    this.getData();

  }



  Future _getpool() async {
    //  _filter = _filter.text;
    http.Response hasil = await http.get(
        Uri.encodeFull('http://adityo.xyz/jatis_trans/pencarian.php?pool_name='+ _filter.text),
        headers: {"Accept": "application/json"});

    //await new Future.dela7yed(new Duration(seconds: 5));

    this.setState(() {
      print(_filter.text);
      list = json.decode(hasil.body);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: SingleChildScrollView(
                // margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height:170,
                          width: double.infinity,
                          color: Colors.orange[400],
                        ),
                        Column(
                          children: <Widget>[
                            AppBar(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              title: Text('Pilih Keberangkatan'),
                              actions: <Widget>[
                                IconButton(onPressed: (){
                                  _getpool();
                                },
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right: 60),
                                    child: Icon(Icons.search),
                                  ),
                                ),
                                // Icon(Icons.threesixty),
                              ],


                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Column(

                            children: <Widget>[

                              Container(
                                margin: EdgeInsets.all(15),
                                child: Card(
                                  child: Container(

                                    child: TextField(
                                      controller: _filter,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                                        hintText: "Cari Kota Keberangkatan ",
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.location_on),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              // mainAxisSpacing: 20.0,
              crossAxisSpacing: 20,
              childAspectRatio: 6,
              //childAspectRatio : 5.0,
              //  childAspectRatio: (itemWidth / itemHeight),
            ),
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index){
              return new Container(

                padding: const EdgeInsets.only(right: 5,left: 5),
                //  margin: EdgeInsets.only(bottom: 50,right: 8,left: 8,top: 20),
                child: new GestureDetector(
                  onTap:(){
                    Navigator.pop(context, list[index]);
                  },
                  child: Card(
                    child: new ListTile(
                      title: new Text(
                          '${list[index]['city_name']} - ${list[index]['pool_name']} '),
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
            }, childCount: list == null ? 0 : list.length),
          ),
        ],
      ),
    );
  }
}

/*class ItemList extends StatelessWidget {
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

 */
