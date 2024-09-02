import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'main_goals_state.dart';

class MainGoalsCubit extends Cubit<MainGoalsState> {
  MainGoalsCubit() : super(InitialState());

  static MainGoalsCubit get(context) => BlocProvider.of(context);

  var addTextController = TextEditingController();
  var editTextController = TextEditingController();

  initSql() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'goals.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('''CREATE TABLE Goals 
              (id INTEGER PRIMARY KEY,
               name TEXT
                )''');
    });
  }

  List<Map> goalsList = [];

  getData() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'goals.db');
    Database database = await openDatabase(path);

    await database.rawQuery('SELECT * FROM Goals').then((value) {
      goalsList = value;
      emit(GetDataSuccessState());
    }).catchError((onError) {
      emit(GetErrorState());
      print(onError.toString());
    });

    database.close();
  }

  insertData(String name) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'goals.db');
    Database database = await openDatabase(path);

    await database
        .rawInsert('INSERT INTO Goals(name) VALUES(?)', [name]).then((value) {
      emit(InsertDataSuccessState());
    }).catchError((onError) {
      emit(InsertDataErrorState());
      print(onError.toString());
    });
    database.close();
  }

  removeData(id) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'goals.db');
    Database database = await openDatabase(path);

    await database
        .rawDelete('DELETE FROM Goals WHERE id = ?', ['$id']).then((value) {
      emit(RemoveDataSuccessState());
    }).catchError((onError) {
      emit(RemoveDataErrorState());
      print(onError.toString());
    });
  }

  updateData({required int id,required String name}) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'goals.db');
    Database database = await openDatabase(path);
    await database
        .update('Goals', {'name': name}, where: 'id == $id')
        .then((value) {
      emit(RemoveDataSuccessState());
    }).catchError((onError) {
      emit(RemoveDataErrorState());
      print(onError.toString());
    });
  }
}
