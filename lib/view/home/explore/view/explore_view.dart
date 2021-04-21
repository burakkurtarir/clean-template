import 'package:clean_template/core/base/view/base_view.dart';
import 'package:clean_template/core/init/network/network_manager.dart';
import 'package:clean_template/view/home/explore/service/explore_service.dart';
import 'package:clean_template/view/home/explore/viewmodel/cubit/explore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './subview/states_widget.dart';

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
