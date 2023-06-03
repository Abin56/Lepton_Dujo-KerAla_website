// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LeptonTarifModel {
  String id;
  String noofstudents;
  String maxtoken;
  String price;
  String typename;
  LeptonTarifModel({
    required this.id,
    required this.noofstudents,
    required this.maxtoken,
    required this.price,
    required this.typename,
  });

  LeptonTarifModel copyWith({
    String? id,
    String? noofstudents,
    String? maxtoken,
    String? price,
    String? typename,
  }) {
    return LeptonTarifModel(
      id: id ?? this.id,
      noofstudents: noofstudents ?? this.noofstudents,
      maxtoken: maxtoken ?? this.maxtoken,
      price: price ?? this.price,
      typename: typename ?? this.typename,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'noofstudents': noofstudents,
      'maxtoken': maxtoken,
      'price': price,
      'typename': typename,
    };
  }

  factory LeptonTarifModel.fromMap(Map<String, dynamic> map) {
    return LeptonTarifModel(
      id: map['id'] as String,
      noofstudents: map['noofstudents'] as String,
      maxtoken: map['maxtoken'] as String,
      price: map['price'] as String,
      typename: map['typename'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LeptonTarifModel.fromJson(String source) => LeptonTarifModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LeptonTarifModel(id: $id, noofstudents: $noofstudents, maxtoken: $maxtoken, price: $price, typename: $typename)';
  }

  @override
  bool operator ==(covariant LeptonTarifModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.noofstudents == noofstudents &&
      other.maxtoken == maxtoken &&
      other.price == price &&
      other.typename == typename;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      noofstudents.hashCode ^
      maxtoken.hashCode ^
      price.hashCode ^
      typename.hashCode;
  }
}
