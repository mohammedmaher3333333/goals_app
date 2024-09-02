import 'package:flutter/material.dart';
import 'package:goals/core/cubits/main_goals_cubit.dart';

Future<dynamic> buildShowDialogEditGoals(index, BuildContext context, id) {
  MainGoalsCubit.get(context).editTextController.text =
      MainGoalsCubit.get(context).goalsList[index]['name'];
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SizedBox(
        height: 190,
        child: Column(
          children: [
            Container(
              color: Colors.blue[900],
              height: 30,
              child: const Center(
                child: Text(
                  'Editting',
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
              controller: MainGoalsCubit.get(context).editTextController,
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
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        MainGoalsCubit.get(context).updateData(
                            id: id,
                            name: MainGoalsCubit.get(context)
                                .editTextController
                                .text);
                        MainGoalsCubit.get(context).getData();
                        Navigator.pop(context);
                      },
                      child: const Text('Update')),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        MainGoalsCubit.get(context).removeData(id);
                        MainGoalsCubit.get(context).getData();
                        Navigator.pop(context);
                      },
                      child: const Text('Remove')),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
            ),
          ],
        ),
      ),
    ),
  );
}
