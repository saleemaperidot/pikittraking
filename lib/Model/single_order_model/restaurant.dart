import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  int? id;
  String? name;
  String? description;
  @JsonKey(name: 'location_id')
  dynamic locationId;
  String? image;
  String? rating;
  dynamic promotext;
  @JsonKey(name: 'delivery_time')
  String? deliveryTime;
  @JsonKey(name: 'price_range')
  String? priceRange;
  @JsonKey(name: 'is_pureveg')
  int? isPureveg;
  String? slug;
  @JsonKey(name: 'placeholder_image')
  dynamic placeholderImage;
  String? latitude;
  String? longitude;
  dynamic certificate;
  @JsonKey(name: 'restaurant_charges')
  dynamic restaurantCharges;
  @JsonKey(name: 'delivery_charges')
  dynamic deliveryCharges;
  String? address;
  String? pincode;
  String? landmark;
  String? sku;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'is_accepted')
  int? isAccepted;
  @JsonKey(name: 'is_featured')
  int? isFeatured;
  @JsonKey(name: 'commission_rate')
  String? commissionRate;
  @JsonKey(name: 'government_tax')
  String? governmentTax;
  @JsonKey(name: 'delivery_type')
  int? deliveryType;
  @JsonKey(name: 'delivery_radius')
  int? deliveryRadius;
  @JsonKey(name: 'delivery_charge_type')
  String? deliveryChargeType;
  @JsonKey(name: 'base_delivery_charge')
  String? baseDeliveryCharge;
  @JsonKey(name: 'base_delivery_distance')
  int? baseDeliveryDistance;
  @JsonKey(name: 'extra_delivery_charge')
  String? extraDeliveryCharge;
  @JsonKey(name: 'extra_delivery_distance')
  int? extraDeliveryDistance;
  @JsonKey(name: 'min_order_price')
  String? minOrderPrice;
  @JsonKey(name: 'is_notifiable')
  int? isNotifiable;
  @JsonKey(name: 'auto_acceptable')
  int? autoAcceptable;
  @JsonKey(name: 'schedule_data')
  dynamic scheduleData;
  @JsonKey(name: 'is_schedulable')
  int? isSchedulable;
  @JsonKey(name: 'order_column')
  int? orderColumn;
  @JsonKey(name: 'custom_message')
  dynamic customMessage;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.locationId,
    this.image,
    this.rating,
    this.promotext,
    this.deliveryTime,
    this.priceRange,
    this.isPureveg,
    this.slug,
    this.placeholderImage,
    this.latitude,
    this.longitude,
    this.certificate,
    this.restaurantCharges,
    this.deliveryCharges,
    this.address,
    this.pincode,
    this.landmark,
    this.sku,
    this.isActive,
    this.isAccepted,
    this.isFeatured,
    this.commissionRate,
    this.governmentTax,
    this.deliveryType,
    this.deliveryRadius,
    this.deliveryChargeType,
    this.baseDeliveryCharge,
    this.baseDeliveryDistance,
    this.extraDeliveryCharge,
    this.extraDeliveryDistance,
    this.minOrderPrice,
    this.isNotifiable,
    this.autoAcceptable,
    this.scheduleData,
    this.isSchedulable,
    this.orderColumn,
    this.customMessage,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return _$RestaurantFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
