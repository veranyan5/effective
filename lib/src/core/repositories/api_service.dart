import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/home/data/models/offer_model.dart';
import '../../features/search/data/models/ticket_model.dart';
import '../../features/search/data/models/ticket_offer_model.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('00727197-24ae-48a0-bcb3-63eb35d7a9de')
  Future<OfferList> getOffers();
  @GET('3424132d-a51a-4613-b6c9-42b2d214f35f')
  Future<TicketOffersResponse> getTicketOffers();
  @GET('2dbc0999-86bf-4c08-8671-bac4b7a5f7eb')
  Future<Tickets> getTickets();
}
