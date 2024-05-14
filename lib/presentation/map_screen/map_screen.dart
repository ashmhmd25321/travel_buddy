import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelbuddy2/widgets/app_bar/custom_app_bar.dart';

class MapScreen extends StatefulWidget {
  static const String routeName = '/map';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => MapScreen(),
    );
  }

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(8.011089189043867, 80.51279875474913),
          infoWindow: InfoWindow(
            title: 'Aukana Statue',
            snippet: 'A historical statue',
          ),
        ),
      );

      _markers.add(
        Marker(
          markerId: MarkerId('id-2'),
          position: LatLng(8.33358796277725, 80.37980666149683),
          infoWindow: InfoWindow(
            title: 'Thisa Wewa',
            snippet: 'A Lake made by Dewanmpiyathissa King',
          ),
        ),
      );

      _markers.add(
        Marker(
          markerId: MarkerId('id-3'),
          position: LatLng(8.351502457644695, 80.40377636853924),
          infoWindow: InfoWindow(
            title: 'Jethawanaramaya',
            snippet: 'A religious Place',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('Map')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(8.3330, 80.5000),
          zoom: 9,
        ),
        markers: _markers,
      ),
    );
  }
}
