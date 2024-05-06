import 'package:json_annotation/json_annotation.dart';
part 'offer_model.g.dart';

@JsonSerializable()
class OfferList {

  factory OfferList.fromJson(Map<String, dynamic> json) => _$OfferListFromJson(json);

  OfferList({
    this.offers,
  });
  @JsonKey(name: 'offers')
  List<Offer>? offers;

  OfferList copyWith({
    List<Offer>? offers,
  }) =>
      OfferList(
        offers: offers ?? this.offers,
      );

  Map<String, dynamic> toJson() => _$OfferListToJson(this);
}

@JsonSerializable()
class Offer {

  Offer({
    this.id,
    this.title,
    this.town,
    this.price,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'town')
  String? town;
  @JsonKey(name: 'price')
  Price? price;

  Offer copyWith({
    int? id,
    String? title,
    String? town,
    Price? price,
  }) =>
      Offer(
        id: id ?? this.id,
        title: title ?? this.title,
        town: town ?? this.town,
        price: price ?? this.price,
      );

  Map<String, dynamic> toJson() => _$OfferToJson(this);
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
