import 'package:flutter/material.dart';
import 'package:random_user/widgets/showData.dart';

import '../models/fetchData.dart';

class DataList extends StatefulWidget {
  const DataList({Key? key}) : super(key: key);

  @override
  State<DataList> createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  dynamic response;

  void initState() {
    super.initState();
    response = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: response,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              String title = snapshot.data[index]['name']['title'];
              String firstName = snapshot.data[index]['name']['first'];
              String lastName = snapshot.data[index]['name']['last'];
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        '$title $firstName $lastName',
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => showData(
                                info: snapshot.data[index],
                              ),
                            ),
                          );
                        },
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          snapshot.data[index]['picture']['large'],
                        ),
                      ),
                      subtitle: Text(snapshot.data[index]['email']),
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
