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
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 110,
                  width: double.infinity,
                  color: Colors.orange[400],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          child: TextField(
                            controller: _filter,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15.0),
                              hintText: "Cari Kota Keberangkatan ",
                              border: InputBorder.none,
                              // prefixIcon: Icon(Icons.location_on),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  searchPool();
                                },
                                icon: Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Icon(Icons.search),
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
            new Expanded(
              child: (list == null || list.isEmpty)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pop(context, list[index]);
                          },
                          child: Card(
                            child: new ListTile(
                              title: new Text(
                                  '${list[index]['city_name']} - ${list[index]['pool_name']}'),
                              leading: Icon(
                                Icons.location_city,
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ));
  }
}
