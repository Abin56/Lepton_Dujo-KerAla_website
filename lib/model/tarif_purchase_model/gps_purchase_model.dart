// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GpsPurchaseModel {
    int quantity;
  int totalamount;
  String product;
  String price;
  GpsPurchaseModel({
    required this.quantity,
    required this.totalamount,
    required this.product,
    required this.price,
  });
  

  GpsPurchaseModel copyWith({
    int? quantity,
    int? totalamount,
    String? product,
    String? price,
  }) {
    return GpsPurchaseModel(
      quantity: quantity ?? this.quantity,
      totalamount: totalamount ?? this.totalamount,
      product: product ?? this.product,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'totalamount': totalamount,
      'product': product,
      'price': price,
    };
  }

  factory GpsPurchaseModel.fromMap(Map<String, dynamic> map) {
    return GpsPurchaseModel(
      quantity: map['quantity'] as int,
      totalamount: map['totalamount'] as int,
      product: map['product'] as String,
      price: map['price'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GpsPurchaseModel.fromJson(String source) => GpsPurchaseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GpsPurchaseModel(quantity: $quantity, totalamount: $totalamount, product: $product, price: $price)';
  }

  @override
  bool operator ==(covariant GpsPurchaseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.quantity == quantity &&
      other.totalamount == totalamount &&
      other.product == product &&
      other.price == price;
  }

  @override
  int get hashCode {
    return quantity.hashCode ^
      totalamount.hashCode ^
      product.hashCode ^
      price.hashCode;
  }
}
