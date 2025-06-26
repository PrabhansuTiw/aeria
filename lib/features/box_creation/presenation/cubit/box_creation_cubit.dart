import 'package:aeria/features/box_creation/presenation/cubit/box_creation_state.dart';
import 'package:bloc/bloc.dart';

class BoxCreationCubit extends Cubit<BoxCreationState> {
  BoxCreationCubit() : super(BoxCreationState.initial());

  void setBoxCount(int count) {
    if (count < 5 || count > 25) {
      emit(state.copyWith(error: 'Enter number between 5 and 25'));
      return;
    }
    emit(
      BoxCreationState(
        count: count,
        colors: List.generate(count, (_) => false),
        clickOrder: [],
        isAnimating: false,
      ),
    );
  }

  void toggleColor(int index) {
    if (state.isAnimating || state.colors[index]) return;

    final updatedColors = [...state.colors];
    final updatedOrder = [...state.clickOrder];

    updatedColors[index] = true;
    updatedOrder.add(index);

    emit(state.copyWith(colors: updatedColors, clickOrder: updatedOrder));

    if (updatedColors.every((c) => c)) _startReverting(updatedOrder);
  }

  void _startReverting(List<int> order) async {
    emit(state.copyWith(isAnimating: true));
    final updatedColors = [...state.colors];

    for (int i = order.length - 1; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      updatedColors[order[i]] = false;
      emit(state.copyWith(colors: [...updatedColors]));
    }

    emit(state.copyWith(clickOrder: [], isAnimating: false));
  }
}
