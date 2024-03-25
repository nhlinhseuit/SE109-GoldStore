import 'package:equatable/equatable.dart';

class PriceModel extends Equatable {
  final double buy;
  final double sell;
  const PriceModel({
    required this.buy,
    required this.sell,
  });

  @override
  List<Object> get props => [buy, sell];

  factory PriceModel.empty() => const PriceModel(buy: 0, sell: 0);

  PriceModel copyWith({
    double? buy,
    double? sell,
  }) {
    return PriceModel(
      buy: buy ?? this.buy,
      sell: sell ?? this.sell,
    );
  }

  @override
  bool get stringify => true;
}
