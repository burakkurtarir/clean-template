import '../../viewmodel/cubit/explore_cubit.dart';
import 'package:flutter/material.dart';

extension ExploreCompletedWidget on ExploreCompletedState {
  Widget buildWidget() {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        // print(scrollNotification.metrics.pixels);
        return true;
      },
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final data = todoList[index];

          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text('${data.title}'),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            Divider(thickness: 1),
      ),
    );
  }
}

extension ExploreErrorWidget on ExploreErrorState {
  Widget buildWidget() {
    return Text('Bir hata oluştu');
  }
}

extension ExploreLoadingWidget on ExploreLoadingState {
  Widget buildWidget() {
    return CircularProgressIndicator();
  }
}
