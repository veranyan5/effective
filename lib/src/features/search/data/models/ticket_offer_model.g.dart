// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketOffersResponse _$TicketOffersResponseFromJson(
        Map<String, dynamic> json) =>
    TicketOffersResponse(
      ticketsOffers: (json['tickets_offers'] as List<dynamic>?)
          ?.map((e) => TicketsOffer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketOffersResponseToJson(
        TicketOffersResponse instance) =>
    <String, dynamic>{
      'tickets_offers': instance.ticketsOffers,
    };

TicketsOffer _$TicketsOfferFromJson(Map<String, dynamic> json) => TicketsOffer(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      timeRange: (json['time_range'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketsOfferToJson(TicketsOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'time_range': instance.timeRange,
      'price': instance.price,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'value': instance.value,
    };
