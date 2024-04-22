import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Myloc extends StatefulWidget {
  const Myloc({super.key});

  @override
  State<Myloc> createState() => _MylocState();
}

class _MylocState extends State<Myloc> {
  Position? position;
  fetchpos() async {
    bool seravail;
    LocationPermission permission;
    seravail = await Geolocator.isLocationServiceEnabled();
    if (!seravail) {
      return Future.error('Location service are disapled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permission denied');
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      Position currentposition = await Geolocator.getCurrentPosition();
      setState(() {
        position = currentposition;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.person),
        title: Text("Image Picker from gallery"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(position == null ? 'Location' : position.toString()),
            ElevatedButton(
                onPressed: () {
                  fetchpos();
                },
                child: Text("Get Location"))
          ],
        ),
      ),
    );
  }
}
