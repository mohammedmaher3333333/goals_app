import 'package:flutter/material.dart';
import 'package:goals/core/cubits/main_goals_cubit.dart';

Future<dynamic> buildShowDialogAddGoals(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SizedBox(
        height: 140,
        child: Column(
          children: [
            Container(
              color: Colors.blue[900],
              height: 30,
              child: const Center(
                child: Text(
                  'Write your Goal:',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              autofocus: true,
              controller: MainGoalsCubit.get(context).addTextController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                label: const Text('Write Here...'),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                contentPadding: const EdgeInsets.all(5),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        MainGoalsCubit.get(context).insertData(
                          MainGoalsCubit.get(context)
                              .addTextController
                              .text
                              .toString(),
                        );
                        MainGoalsCubit.get(context).addTextController.clear();
                        MainGoalsCubit.get(context).getData();
                        Navigator.pop(context);
                      },
                      child: const Text('ADD')),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
