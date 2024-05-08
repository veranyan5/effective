import 'package:json_annotation/json_annotation.dart';
part 'ticket_model.g.dart';
@JsonSerializable()
class Tickets {

  Tickets({
    this.tickets,
  });

  factory Tickets.fromJson(Map<String, dynamic> json) => _$TicketsFromJson(json);
  @JsonKey(name: 'tickets')
  List<Ticket>? tickets;

  Tickets copyWith({
    List<Ticket>? tickets,
  }) =>
      Tickets(
        tickets: tickets ?? this.tickets,
      );

  Map<String, dynamic> toJson() => _$TicketsToJson(this);
}

@JsonSerializable()
class Ticket {

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Ticket({
    this.id,
    this.badge,
    this.price,
    this.providerName,
    this.company,
    this.departure,
    this.arrival,
    this.hasTransfer,
    this.hasVisaTransfer,
    this.luggage,
    this.handLuggage,
    this.isReturnable,
    this.isExchangable,
  });
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'badge')
  String? badge;
  @JsonKey(name: 'price')
  Price? price;
  @JsonKey(name: 'provider_name')
  String? providerName;
  @JsonKey(name: 'company')
  String? company;
  @JsonKey(name: 'departure')
  Arrival? departure;
  @JsonKey(name: 'arrival')
  Arrival? arrival;
  @JsonKey(name: 'has_transfer')
  bool? hasTransfer;
  @JsonKey(name: 'has_visa_transfer')
  bool? hasVisaTransfer;
  @JsonKey(name: 'luggage')
  Luggage? luggage;
  @JsonKey(name: 'hand_luggage')
  HandLuggage? handLuggage;
  @JsonKey(name: 'is_returnable')
  bool? isReturnable;
  @JsonKey(name: 'is_exchangable')
  bool? isExchangable;

  Ticket copyWith({
    int? id,
    String? badge,
    Price? price,
    String? providerName,
    String? company,
    Arrival? departure,
    Arrival? arrival,
    bool? hasTransfer,
    bool? hasVisaTransfer,
    Luggage? luggage,
    HandLuggage? handLuggage,
    bool? isReturnable,
    bool? isExchangable,
  }) =>
      Ticket(
        id: id ?? this.id,
        badge: badge ?? this.badge,
        price: price ?? this.price,
        providerName: providerName ?? this.providerName,
        company: company ?? this.company,
        departure: departure ?? this.departure,
        arrival: arrival ?? this.arrival,
        hasTransfer: hasTransfer ?? this.hasTransfer,
        hasVisaTransfer: hasVisaTransfer ?? this.hasVisaTransfer,
        luggage: luggage ?? this.luggage,
        handLuggage: handLuggage ?? this.handLuggage,
        isReturnable: isReturnable ?? this.isReturnable,
        isExchangable: isExchangable ?? this.isExchangable,
      );

  Map<String, dynamic> toJson() => _$TicketToJson(this);
}

@JsonSerializable()
class Arrival {

  Arrival({
    this.town,
    this.date,
    this.airport,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => _$ArrivalFromJson(json);
  @JsonKey(name: 'town')
  Town? town;
  @JsonKey(name: 'date')
  DateTime? date;
  @JsonKey(name: 'airport')
  Airport? airport;

  Arrival copyWith({
    Town? town,
    DateTime? date,
    Airport? airport,
  }) =>
      Arrival(
        town: town ?? this.town,
        date: date ?? this.date,
        airport: airport ?? this.airport,
      );

  Map<String, dynamic> toJson() => _$ArrivalToJson(this);
}

enum Airport {
  @JsonValue('AER')
  AER,
  @JsonValue('VKO')
  VKO
}

enum Town {
  @JsonValue('Сочи')
  EMPTY,
  @JsonValue('Москва')
  TOWN
}

@JsonSerializable()
class HandLuggage {

  HandLuggage({
    this.hasHandLuggage,
    this.size,
  });

  factory HandLuggage.fromJson(Map<String, dynamic> json) => _$HandLuggageFromJson(json);
  @JsonKey(name: 'has_hand_luggage')
  bool? hasHandLuggage;
  @JsonKey(name: 'size')
  String? size;

  HandLuggage copyWith({
    bool? hasHandLuggage,
    String? size,
  }) =>
      HandLuggage(
        hasHandLuggage: hasHandLuggage ?? this.hasHandLuggage,
        size: size ?? this.size,
      );

  Map<String, dynamic> toJson() => _$HandLuggageToJson(this);
}

@JsonSerializable()
class Luggage {

  Luggage({
    this.hasLuggage,
    this.price,
  });

  factory Luggage.fromJson(Map<String, dynamic> json) => _$LuggageFromJson(json);
  @JsonKey(name: 'has_luggage')
  bool? hasLuggage;
  @JsonKey(name: 'price')
  Price? price;

  Luggage copyWith({
    bool? hasLuggage,
    Price? price,
  }) =>
      Luggage(
        hasLuggage: hasLuggage ?? this.hasLuggage,
        price: price ?? this.price,
      );

  Map<String, dynamic> toJson() => _$LuggageToJson(this);
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
