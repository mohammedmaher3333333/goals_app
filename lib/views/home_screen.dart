import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goals/core/cubits/main_goals_cubit.dart';
import 'package:goals/widgets/goal_item.dart';

import '../widgets/show_dialog_add_goals.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainGoalsCubit()..initSql()..getData(),
      child: BlocConsumer<MainGoalsCubit, MainGoalsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'GOALS',
                  style: TextStyle(
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 37,
                  ),
                ),
              ),
              backgroundColor: Colors.blue[900],
            ),
            body: ListView.builder(
              itemCount: MainGoalsCubit.get(context).goalsList.length,
              itemBuilder: (context, index) => goalItem(index,
                context,
                MainGoalsCubit.get(context).goalsList[index]['id'],
                MainGoalsCubit.get(context).goalsList[index]['name'],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                buildShowDialogAddGoals(context);
              },
              child: const Icon(
                Icons.add,
                size: 33,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
