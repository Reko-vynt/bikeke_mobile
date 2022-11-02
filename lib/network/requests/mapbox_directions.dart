import 'package:bikeke_app/helpers/dio_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

String baseUrl = 'https://api.mapbox.com/directions/v5/mapbox';
String accessToken =
    'sk.eyJ1IjoiYmlrZWtlYXBwIiwiYSI6ImNsOXhkM2hpbjA5Zjgzb3BudTRzenE4cmgifQ.uxW9g_kHepSWSnZ3NA7qTw';
String navType = 'driving';

Dio _dio = Dio();

Future getCyclingRouteUsingMapbox(LatLng source, LatLng destination) async {
  String url =
      '$baseUrl/$navType/${source.longitude},${source.latitude};${destination.longitude},${destination.latitude}?alternatives=true&continue_straight=true&geometries=geojson&language=en&overview=full&steps=true&access_token=$accessToken';
  try {
    _dio.options.contentType = Headers.jsonContentType;
    final responseData = await _dio.get(url);
    return responseData.data;
  } catch (e) {
    final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
    debugPrint(errorMessage);
  }
}
