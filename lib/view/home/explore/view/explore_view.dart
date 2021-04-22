import '../../../../core/base/view/base_view.dart';
import '../../../../core/init/network/network_manager.dart';
import '../service/explore_service.dart';
import '../viewmodel/cubit/explore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'subview/states_widget.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exploreCubit = ExploreCubit(
      ExploreService(coreDio: NetworkManager.instance!.coreDio),
    );

    return BaseView<ExploreCubit>(
      builder: (context, value) {
        return BlocProvider(
          create: (_) => exploreCubit,
          lazy: true,
          child: BlocConsumer<ExploreCubit, ExploreState>(
            listener: (context, state) {},
            builder: (context, state) {
              return buildScaffold(state);
            },
          ),
        );
      },
      viewModel: ExploreCubit(
        ExploreService(coreDio: NetworkManager.instance!.coreDio),
      ),
      onReady: (value) {},
    );
  }

  Scaffold buildScaffold(ExploreState state) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: buildBody(state),
    );
  }

  Widget buildBody(ExploreState state) {
    if (state is ExploreLoadingState) {
      return state.buildWidget();
    } else if (state is ExploreCompletedState) {
      return state.buildWidget();
    } else if (state is ExploreErrorState) {
      return state.buildWidget();
    }
    return Container();
  }
}

/* 
Column(
          children: [
            Card(
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
              child: Text(
                'Donate Now!',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text(
                'Donate Now!',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Donate Now!'),
              ),
            ),
            NumberPicker(
              axis: Axis.horizontal,
              maxValue: 100,
              minValue: 10,
              onChanged: (int value) {},
              value: 50,
            ),
          ],
        ),
*/
