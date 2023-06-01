// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BiomatericPurchaseModel {
    int quantity;
  int totalamount;
  String product;
  String price;
  BiomatericPurchaseModel({
    required this.quantity,
    required this.totalamount,
    required this.product,
    required this.price,
  });

  BiomatericPurchaseModel copyWith({
    int? quantity,
    int? totalamount,
    String? product,
    String? price,
  }) {
    return BiomatericPurchaseModel(
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

  factory BiomatericPurchaseModel.fromMap(Map<String, dynamic> map) {
    return BiomatericPurchaseModel(
      quantity: map['quantity'] as int,
      totalamount: map['totalamount'] as int,
      product: map['product'] as String,
      price: map['price'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BiomatericPurchaseModel.fromJson(String source) => BiomatericPurchaseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BiomatericPurchaseModel(quantity: $quantity, totalamount: $totalamount, product: $product, price: $price)';
  }

  @override
  bool operator ==(covariant BiomatericPurchaseModel other) {
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
