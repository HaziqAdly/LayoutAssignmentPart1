import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey,
      ),
      home: const MyHomePage(title: 'Smart Home Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> _features = [
    {
      'function' : 'Front Door',
      'state' : false,
      'icon' : Icons.sensor_door_outlined,
    },
    {
      'function' : 'Front Window',
      'state' : false,
      'icon' : Icons.sensor_window_outlined,
    },
    {
      'function' : 'Entrance Lamp',
      'state' : false,
      'icon' : Icons.light_outlined,
    },
    {
      'function' : 'Outdoor CCTV',
      'state' : false,
      'icon' : Icons.camera_outdoor_outlined,
    },
    {
      'function' : 'Indoor CCTV',
      'state' : false,
      'icon' : Icons.camera_indoor_outlined,
    },
    {
      'function' : 'Outdoor Lamp',
      'state' : false,
      'icon' : Icons.lightbulb_outlined,
    },
    {
      'function' : 'Indoor Lamp',
      'state' : false,
      'icon' : Icons.light_outlined,
    },
    {
      'function' : 'Outdoor Plug',
      'state' : false,
      'icon' : Icons.power_outlined,
    },
    {
      'function' : 'Indoor Plug',
      'state' : false,
      'icon' : Icons.power_outlined,
    },
  ];

  void _tapContainer(int index){
    setState(() {
      _features[index]['state'] = !_features[index]['state'];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.builder(
          primary: false,
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 175,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1
          ),
          itemCount: _features.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => _tapContainer(index),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(35),
                child: Column(
                  children: <Widget>[
                    Text(_features[index]['function']),
                    Icon(_features[index]['icon'], color: _features[index]['state'] ? Colors.green : Colors.black, size: 50.0),
                    Text(_features[index]['state'] ? "On" : "Off"),
                  ],
                ),
              ),
            );
          },
        )
      ),
    );
  }
}
