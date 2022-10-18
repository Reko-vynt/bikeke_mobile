import 'package:bikeke_app/helpers/shared_prefs.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class AppConstants {
  static LocationData? currentLocation;
  static const String mapBoxAccessToken =
      'sk.eyJ1IjoiYmlrZWtlYXBwIiwiYSI6ImNsOWQ0enUzaTA1dGEzb2w5cHBnd2g2cTUifQ.bvZzCcgCbJ3w_dfddXw7zg';

  static const String mapBoxStyleId =
      'mapbox://styles/bikekeapp/cl8rjpomp000n15t76z5cj7a9';
  static LatLng currentlocation = getCurrentLatLngFromSharedPrefs();
  static final myLocation =
      LatLng(currentlocation.latitude, currentlocation.longitude);
  void getLocation() async {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });
  }

  LatLng getLoc(LocationData currentLocation) {
    return LatLng(currentLocation.latitude ?? currentlocation.latitude,
        currentLocation.longitude ?? currentlocation.latitude);
  }
}
