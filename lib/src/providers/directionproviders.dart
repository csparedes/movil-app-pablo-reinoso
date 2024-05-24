import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;

import 'package:google_maps_webservice/directions.dart';

class DirectionProviders extends ChangeNotifier {
  final markerStream = new StreamController();
  //Stream<maps.Marker> get markerGet => markerStream.stream;
  Map<gmap.MarkerId, gmap.Marker> marcadores = Map();

  GoogleMapsDirections directionsApi =
      GoogleMapsDirections(apiKey: "AIzaSyChvkVMOU2-VrXs_2lvNIvaz9Bpq_IIH9I");
  Set<gmap.Polyline> _route = Set();
  Set<gmap.Circle> _listCirculos = Set();

// double _coordinateDistance(lat1, lon1, lat2, lon2) {
//   var p = 0.017453292519943295;
//   var c = cos;
//   var a = 0.5 -
//       c((lat2 - lat1) * p) / 2 +
//       c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
//   return 12742 * asin(sqrt(a));
// }
}
