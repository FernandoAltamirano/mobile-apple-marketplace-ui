import 'package:apple_store_ui/bloc/market/market_bloc.dart';
import 'package:apple_store_ui/models/api_response_model.dart';
import 'package:apple_store_ui/models/models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiClient {
  static final Dio _dio = Dio(BaseOptions(baseUrl: "", headers: {
    "Accept": "application/json",
    "Content-Type": "application/json"
  }));

  static get(BuildContext context) async {
    try {
      BlocProvider.of<MarketBloc>(context)
          .add(SetGetAllProductsLoadingEvent(loading: true));
      final Response response = await _dio.get('/api');
      final ApiResponse apiResponse = ApiResponse.fromMap(response.data);
      if (apiResponse.message == "success") {
        BlocProvider.of<MarketBloc>(context)
            .add(MarketInitialEvent(products: apiResponse.data));
      }
    } catch (e) {
      print(e);
    }
  }
}
