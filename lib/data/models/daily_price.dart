import 'package:equatable/equatable.dart';

class DailyPrice extends Equatable {
  final String? id;
  final String name;
  final double buy;
  final double sell;
  const DailyPrice({
    required this.id,
    required this.name,
    required this.buy,
    required this.sell,
  });

  DailyPrice copyWith({
    String? id,
    String? name,
    double? buy,
    double? sell,
  }) {
    return DailyPrice(
      id: id ?? this.id,
      name: name ?? this.name,
      buy: buy ?? this.buy,
      sell: sell ?? this.sell,
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
    return DailyPrice(
      id: id,
      name: json['name'] as String,
      buy: json['buy'] as double,
      sell: json['sell'] as double,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, buy, sell];
}
