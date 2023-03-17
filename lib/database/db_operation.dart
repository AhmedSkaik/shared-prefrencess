import 'package:sherd_pref_app/database/db_controller.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbOperation<Model> {
 final  Database database = DbController().database;

Future<int> create(Model model) ;
Future<List<Model>> read();
Future<bool> update(Model model);
Future<Model?> show(int id);
Future<bool> delete(Model model);

}