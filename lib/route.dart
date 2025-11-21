import 'package:flutter/material.dart';

class RouteScreen extends StatelessWidget {
  final List<String> route;
  const RouteScreen({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cairo Metro', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 29, 80, 104),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.train, color: Colors.blueGrey),
                title: Text(route[index], style: TextStyle(fontSize: 18)),
                trailing: index == route.length - 1
                    ? Icon(Icons.flag, color: Colors.green) // last station
                    : Icon(Icons.arrow_downward, color: Colors.grey),
              );
            },
            itemCount: route.length,
          ),
        ),
      ),
    );
  }
}
