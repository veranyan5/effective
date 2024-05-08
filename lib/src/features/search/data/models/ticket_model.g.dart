// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tickets _$TicketsFromJson(Map<String, dynamic> json) => Tickets(
      tickets: (json['tickets'] as List<dynamic>?)
          ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketsToJson(Tickets instance) => <String, dynamic>{
      'tickets': instance.tickets,
    };

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      id: (json['id'] as num?)?.toInt(),
      badge: json['badge'] as String?,
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      providerName: json['provider_name'] as String?,
      company: json['company'] as String?,
      departure: json['departure'] == null
          ? null
          : Arrival.fromJson(json['departure'] as Map<String, dynamic>),
      arrival: json['arrival'] == null
          ? null
          : Arrival.fromJson(json['arrival'] as Map<String, dynamic>),
      hasTransfer: json['has_transfer'] as bool?,
      hasVisaTransfer: json['has_visa_transfer'] as bool?,
      luggage: json['luggage'] == null
          ? null
          : Luggage.fromJson(json['luggage'] as Map<String, dynamic>),
      handLuggage: json['hand_luggage'] == null
          ? null
          : HandLuggage.fromJson(json['hand_luggage'] as Map<String, dynamic>),
      isReturnable: json['is_returnable'] as bool?,
      isExchangable: json['is_exchangable'] as bool?,
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'badge': instance.badge,
      'price': instance.price,
      'provider_name': instance.providerName,
      'company': instance.company,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'has_transfer': instance.hasTransfer,
      'has_visa_transfer': instance.hasVisaTransfer,
      'luggage': instance.luggage,
      'hand_luggage': instance.handLuggage,
      'is_returnable': instance.isReturnable,
      'is_exchangable': instance.isExchangable,
    };

Arrival _$ArrivalFromJson(Map<String, dynamic> json) => Arrival(
      town: $enumDecodeNullable(_$TownEnumMap, json['town']),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      airport: $enumDecodeNullable(_$AirportEnumMap, json['airport']),
    );

Map<String, dynamic> _$ArrivalToJson(Arrival instance) => <String, dynamic>{
      'town': _$TownEnumMap[instance.town],
      'date': instance.date?.toIso8601String(),
      'airport': _$AirportEnumMap[instance.airport],
    };

const _$TownEnumMap = {
  Town.EMPTY: 'Сочи',
  Town.TOWN: 'Москва',
};

const _$AirportEnumMap = {
  Airport.AER: 'AER',
  Airport.VKO: 'VKO',
};

HandLuggage _$HandLuggageFromJson(Map<String, dynamic> json) => HandLuggage(
      hasHandLuggage: json['has_hand_luggage'] as bool?,
      size: json['size'] as String?,
    );

Map<String, dynamic> _$HandLuggageToJson(HandLuggage instance) =>
    <String, dynamic>{
      'has_hand_luggage': instance.hasHandLuggage,
      'size': instance.size,
    };

Luggage _$LuggageFromJson(Map<String, dynamic> json) => Luggage(
      hasLuggage: json['has_luggage'] as bool?,
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LuggageToJson(Luggage instance) => <String, dynamic>{
      'has_luggage': instance.hasLuggage,
      'price': instance.price,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'value': instance.value,
    };
