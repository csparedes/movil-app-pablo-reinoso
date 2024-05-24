import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../src/providers/Modelo/posicion.dart';
import '../src/providers/directionproviders.dart';

class home_screen extends StatefulWidget {
  home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  GoogleMapController? _googleMapController;
  LatLng? actual;
  StreamSubscription? periodicSub;

  @override
  void initState() {
    // TODO: implement initState
    posicioactual();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var crossAxisCount2 = 2;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            child: Consumer<DirectionProviders>(
              builder: (BuildContext context, DirectionProviders apigmaps,
                  Widget? Child) {
                // return const Text('Tesis Aplication',
                //     textDirection: TextDirection.ltr);
                return GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    _googleMapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                      target: LatLng(0.335574, -78.210710), zoom: 16),
                  markers: Set.of(apigmaps.marcadores.values),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            height: 120,
            width: 80,
            child: Card(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: "0.00",
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 190),
              height: 600,
              width: 100,
              child: Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () {
                        moverCamara();
                      },
                      backgroundColor: Colors.yellow,
                      child: const Icon(Icons.navigation),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      backgroundColor: Colors.yellowAccent,
                      child: const Icon(Icons.email),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        enviarNotificacion();
                      },
                      backgroundColor: Colors.redAccent,
                      child: const Icon(Icons.crisis_alert),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
    //
  }

  Future<void> posicioactual() async {
    periodicSub = new Stream.periodic(const Duration(seconds: 5))
        .listen((_) => updateMarker());
  }

  Future<void> updateMarker() async {
    Map<dynamic, dynamic> m;
    final response = await http.get(
      Uri.parse('https://flespi.io/gw/devices/4465145/messages'),
      headers: {
        HttpHeaders.authorizationHeader:
            'FlespiToken dP2sjA7Cq9gdPsXchcci3u9Roi0GD3GFIwXPUShbRmewEZxMZzSSTPz5YoAph4UQ',
      },
    ).then((response) {
      if (response.statusCode == 200) {
        String body = utf8.decode(response.bodyBytes);
        final jsonData = jsonDecode(body);
        List a = jsonData["result"];
        m = a.last;
        Posicion p = Posicion.fromJson(m);

        int? dir = p.positionDirection;
        actual = LatLng(p.positionLatitude!, p.positionLongitude!);

        setState(() {
          var api = Provider.of<DirectionProviders>(context, listen: false);
          Marker marcador = Marker(
            markerId: MarkerId("0"),
            position: actual!, //posible error aqui
            // rotation: m["position.direction"].toDouble(),
            draggable: false,
            zIndex: 2,
            flat: true,
            anchor: Offset(0.5, 0.5),
            // icon:
          );

          api.marcadores[marcador.markerId] = marcador;
        });
      }
    });
  }

  void moverCamara() {
    if (_googleMapController != null) {
      _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
          new CameraPosition(bearing: 2, target: actual!, zoom: 18.00)));
    }
  }

  Future<void> enviarNotificacion() async {
    final response = await http
        .post(
      Uri.https('fcm.googleapis.com', '/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'key=AAAA9Srewx0:APA91bH5IrpLuiO_iP44ETSetEZUMR-5_iBneO09AYSoZNLDpf_Qy8teDGmkedwKi_MpvRviYsGbFJJWCCBf-y1xE4SQkX98nD5zUv3jYbQ3iNzVJ9QFHfI8C9XcBUimgsGv56EZ09HP'
      },
      body: jsonEncode({
        "to":
            "eP2Kp8LnRPW6ZOKMzYVfCa:APA91bGfuV7-cGhYSm4vIXwwbGIY0uvG9r76RPx_XlOtSxmoOOQkotJrMveXbocHKXc-SHcJX1o9YqJoPqtJyTCVlvS4ZWfP0UrbZHccQY3QkXOOT2YaBQoKg53cASemlG3jdCdyJbm-",
        "notification": {
          "body": "peligro",
          "priority": "high",
          "subtitle": "Elementary School",
          "title": "Unidad en peligro"
        },
      }),
    )
        .then((response) {
      if (response.statusCode == 200) {
        int a = 1;
      }
    });
  }
}
