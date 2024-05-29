import 'package:equatable/equatable.dart';

class CurrencyPrice extends Equatable {
  final String? id;
  final String name;
  final double buy;
  final DateTime time;
  const CurrencyPrice({
    required this.id,
    required this.name,
    required this.buy,
    required this.time,
  });

  CurrencyPrice copyWith({
    String? id,
    String? name,
    double? buy,
    DateTime? time,
  }) {
    return CurrencyPrice(
      id: id ?? this.id,
      name: name ?? this.name,
      buy: buy ?? this.buy,
      time: time ?? this.time,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'buy': buy,
  //   };
  // }

  // factory CurrencyPrice.fromJson({
  //   String? id,
  //   required Map<String, dynamic> json
  // }) {
  //   String buy = (json['Buy'] as String).replaceAll(',', '');
  //   return CurrencyPrice(
  //     id: id,
  //     name: json['Name'] as String,
  //     buy: double.tryParse(buy) ?? 0,
  //     time: DateTime.parse(json['Time'])
  //   );
  // }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, buy, time];
}
