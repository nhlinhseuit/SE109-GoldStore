import 'package:equatable/equatable.dart';

class DailyPrice extends Equatable {
  final String? id;
  final String name;
  final double buy;
  final double sell;
  final DateTime time;
  const DailyPrice({
    required this.id,
    required this.name,
    required this.buy,
    required this.sell,
    required this.time,
  });

  DailyPrice copyWith({
    String? id,
    String? name,
    double? buy,
    double? sell,
    DateTime? time,
  }) {
    return DailyPrice(
      id: id ?? this.id,
      name: name ?? this.name,
      buy: buy ?? this.buy,
      sell: sell ?? this.sell,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'buy': buy,
      'sell': sell,
    };
  }

  factory DailyPrice.fromJson({
    String? id,
    required Map<String, dynamic> json
  }) {
    String buy = (json['Buy'] as String).replaceAll(',', '');
    String sell = (json['Sell'] as String).replaceAll(',', '');
    return DailyPrice(
      id: id,
      name: json['Name'] as String,
      buy: double.tryParse(buy) ?? 0,
      sell: double.tryParse(sell) ?? 0,
      time: DateTime.parse(json['Time'])
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, buy, sell, time];
}
