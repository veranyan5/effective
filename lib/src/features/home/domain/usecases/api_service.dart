import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../data/models/offer_model.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('00727197-24ae-48a0-bcb3-63eb35d7a9de')
  Future<OfferList> getOffers();
}
