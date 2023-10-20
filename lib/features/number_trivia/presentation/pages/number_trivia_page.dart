import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/number_trivia_cubit.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/number_trivia_state.dart';
import '../bloc/number_trivia_bloc.dart';
import '../widgets/loading_widget.dart';
import '../widgets/message_display.dart';
import '../widgets/trivia_controls.dart';
import '../widgets/trivia_display.dart';

import '../../../../injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }
}

BlocProvider<NumberTriviaCubit> buildBody(BuildContext context) {
  return BlocProvider(
    create: (context) => sl<NumberTriviaCubit>(),
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10),
            // Top half
            BlocBuilder<NumberTriviaCubit, NumberTriviaState>(
              builder: (context, state) {
                if (state is Empty) {
                  return MessageDisplay(
                    message: 'Start searching!',
                  );
                } else if (state is Loaded) {
                  return TriviaDisplay(
                    numberTrivia: state.trivia,
                  );
                } else if (state is Loading) {
                  return LoadingWidget();
                } else if (state is Error) {
                  return MessageDisplay(
                    message: state.message,
                  );
                }
                return SizedBox.shrink();
              },
            ),
            SizedBox(height: 20),
            // Bottom half
            TriviaControls()
          ],
        ),
      ),
    ),
  );
}
