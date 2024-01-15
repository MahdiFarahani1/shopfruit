import 'package:shop/features/feature_home/presentation/blocs/cubit/api_home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

class LocationUser {
  late bool enableLocation;
  late PermissionStatus enbaleWithUser;
  static var lat = 35.69611;
  static var lon = 51.42306;
  LocationData? userLocation;

  Future<void> getUserLocation(BuildContext context) async {
    Location location = Location();

    enableLocation = await location.serviceEnabled();
    if (!enableLocation) {
      enableLocation = await location.requestService();
      if (!enableLocation) {
        BlocProvider.of<HomeCubit>(context).managmentHomeApiData(lat, lon);

        return;
      }
    }

    enbaleWithUser = await location.hasPermission();
    if (enbaleWithUser == PermissionStatus.denied) {
      enbaleWithUser = await location.requestPermission();
      if (enbaleWithUser != PermissionStatus.granted) {
        BlocProvider.of<HomeCubit>(context).managmentHomeApiData(lat, lon);
        return;
      }
    }

    final _locationData = await location.getLocation();

    lat = _locationData.latitude!;
    lon = _locationData.longitude!;
    BlocProvider.of<HomeCubit>(context).managmentHomeApiData(lat, lon);
  }
}
