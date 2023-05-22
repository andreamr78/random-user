import 'package:flutter/material.dart';

class showData extends StatefulWidget {
  const showData({Key? key, this.info}) : super(key: key);

  final dynamic info;

  @override
  State<showData> createState() => _showDataState();
}

class _showDataState extends State<showData> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.info['name']['first']),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage:
                      NetworkImage(widget.info['picture']['large']),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _incrementCounter,
                    icon: Icon(
                      Icons.star_border,
                      color: Colors.pinkAccent,
                      size: 30,
                    ),
                  ),
                  Text(_counter.toString()),
                ],
              ),
              Text(
                widget.info['name']['first'] +
                    ' ' +
                    widget.info['name']['last'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text("Flutter Developer",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone),
                    Text(
                      '  ' + widget.info['phone'],
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wechat_sharp),
                    Text(
                      '  ' + widget.info['cell'],
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.house),
                    Text(
                      '  ' +
                          widget.info['location']['city'] +
                          ', ' +
                          widget.info['location']['state'],
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),

              // Text(data)
            ],
          ),
        ),
      ),
    );
  }
}
