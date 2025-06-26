import 'package:equatable/equatable.dart';

class BoxCreationState extends Equatable {
  final int count;
  final List<bool> colors;
  final List<int> clickOrder;
  final bool isAnimating;
  final String? error;

  const BoxCreationState({
    required this.count,
    required this.colors,
    required this.clickOrder,
    required this.isAnimating,
    this.error,
  });

  factory BoxCreationState.initial() => const BoxCreationState(
    count: 0,
    colors: [],
    clickOrder: [],
    isAnimating: false,
    error: null,
  );

  BoxCreationState copyWith({
    int? count,
    List<bool>? colors,
    List<int>? clickOrder,
    bool? isAnimating,
    String? error,
  }) {
    return BoxCreationState(
      count: count ?? this.count,
      colors: colors ?? this.colors,
      clickOrder: clickOrder ?? this.clickOrder,
      isAnimating: isAnimating ?? this.isAnimating,
      error: error,
    );
  }

  @override
  List<Object?> get props => [count, colors, clickOrder, isAnimating, error];
}
