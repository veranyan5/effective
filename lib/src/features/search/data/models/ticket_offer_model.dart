import 'package:json_annotation/json_annotation.dart';
part 'ticket_offer_model.g.dart';
@JsonSerializable()
class TicketOffersResponse {

  TicketOffersResponse({
    this.ticketsOffers,
  });

  factory TicketOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketOffersResponseFromJson(json);
  @JsonKey(name: 'tickets_offers')
  List<TicketsOffer>? ticketsOffers;

  TicketOffersResponse copyWith({
    List<TicketsOffer>? ticketsOffers,
  }) =>
      TicketOffersResponse(
        ticketsOffers: ticketsOffers ?? this.ticketsOffers,
      );

  Map<String, dynamic> toJson() => _$TicketOffersResponseToJson(this);
}

@JsonSerializable()
class TicketsOffer {

  TicketsOffer({
    this.id,
    this.title,
    this.timeRange,
    this.price,
  });

  factory TicketsOffer.fromJson(Map<String, dynamic> json) => _$TicketsOfferFromJson(json);
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'time_range')
  List<String>? timeRange;
  @JsonKey(name: 'price')
  Price? price;

  TicketsOffer copyWith({
    int? id,
    String? title,
    List<String>? timeRange,
    Price? price,
  }) =>
      TicketsOffer(
        id: id ?? this.id,
        title: title ?? this.title,
        timeRange: timeRange ?? this.timeRange,
        price: price ?? this.price,
      );

  Map<String, dynamic> toJson() => _$TicketsOfferToJson(this);
}

@JsonSerializable()
class Price {

  Price({
    this.value,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  @JsonKey(name: 'value')
  int? value;

  Price copyWith({
    int? value,
  }) =>
      Price(
        value: value ?? this.value,
      );

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
