import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/init/network/network_manager.dart';
import '../service/explore_service.dart';
import '../viewmodel/cubit/explore_cubit.dart';
import 'package:flutter/material.dart';

class ExploreDetailView extends StatelessWidget {
  const ExploreDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exploreCubit = ExploreCubit(
      ExploreService(coreDio: NetworkManager.instance!.coreDio),
    );

    return BlocProvider(
      create: (_) => exploreCubit,
      child: BlocConsumer<ExploreCubit, ExploreState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Todo Detail'), 
            ),
            body: Container(
              child: Text('${exploreCubit.todoList.length}'),
            ),
          );
        },
      ),
    );
  }
}
