import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';

class Pool extends StatefulWidget {
  @override
  _PoolState createState() => _PoolState();
}

class _PoolState extends State<Pool> {
  final _filter = TextEditingController();
  List list;

  getData() async {
    await UserRepository().getPool().then((e) {
      setState(() {
        list = e;
      });
    });
  }

  searchPool() async {
    await UserRepository().searchPool(filter: _filter.text).then((e) {
      setState(() {
        list = e;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    searchPool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange[400],
        title: Text('Pilih Keberangkatan'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              searchPool();
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Icon(Icons.search),
            ),
          ),
          // Icon(Icons.threesixty),
        ],
      ),
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
                      height: 170,
                      width: double.infinity,
                      color: Colors.orange[400],
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
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 15.0),
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
          )),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 20,
              childAspectRatio: 6,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return new Container(
                padding: const EdgeInsets.only(right: 5, left: 5),
                //  margin: EdgeInsets.only(bottom: 50,right: 8,left: 8,top: 20),
                child: new GestureDetector(
                  onTap: () {
                    Navigator.pop(context, list[index]);
                  },
                  child: list.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Card(
                          child: new ListTile(
                            title: new Text(
                                '${list[index]['city_name']} - ${list[index]['pool_name']}'),
                            leading: Icon(
                              Icons.location_city,
                              color: Colors.blue[900],
                            ),
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
