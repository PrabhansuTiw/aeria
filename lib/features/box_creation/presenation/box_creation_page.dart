import 'package:aeria/features/box_creation/presenation/cubit/box_creation_cubit.dart';
import 'package:aeria/features/box_creation/presenation/cubit/box_creation_state.dart';
import 'package:aeria/features/box_creation/presenation/widgets/box_widget.dart';
import 'package:aeria/features/box_creation/presenation/widgets/c_shape_builder.dart';
import 'package:aeria/features/box_creation/presenation/widgets/layout_switch.dart';
import 'package:aeria/features/box_creation/presenation/widgets/number_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoxCreationPage extends StatelessWidget {
  const BoxCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BoxCreationCubit(),
      child: const _BoxCreationView(),
    );
  }
}

class _BoxCreationView extends StatefulWidget {
  const _BoxCreationView();

  @override
  State<_BoxCreationView> createState() => _BoxCreationViewState();
}

class _BoxCreationViewState extends State<_BoxCreationView> {
  final _numberFormKey = GlobalKey<FormState>();
  final _countController = TextEditingController();
  bool _isCShape = true;

  @override
  void dispose() {
    _countController.dispose();
    super.dispose();
  }

  void _onGeneratePressed(BoxCreationCubit cubit) {
    if (_numberFormKey.currentState!.validate()) {
      final n = int.parse(_countController.text.trim());
      cubit.setBoxCount(n);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BoxCreationCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Square Boxes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            NumberInputField(
              formKey: _numberFormKey,
              controller: _countController,
              onSubmitted: (_) => _onGeneratePressed(cubit),
              onGenerate: () => _onGeneratePressed(cubit),
            ),

            const SizedBox(height: 20),

            LayoutSwitch(
              isCShape: _isCShape,
              onToggle: (v) => setState(() => _isCShape = v),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: BlocBuilder<BoxCreationCubit, BoxCreationState>(
                builder: (context, state) {
                  return Center(
                    child:
                        _isCShape
                            ? CShapeBuilder(
                              state: state,
                              onBoxTap: cubit.toggleColor,
                            )
                            : GridBuilder(
                              state: state,
                              onBoxTap: cubit.toggleColor,
                            ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridBuilder extends StatelessWidget {
  const GridBuilder({super.key, required this.state, required this.onBoxTap});

  final BoxCreationState state;
  final void Function(int) onBoxTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: List.generate(state.count, (i) {
        return BoxWidget(
          isGreen: state.colors[i],
          onTap: () => onBoxTap(i),
          size: Size.square(50),
        );
      }),
    );
  }
}
