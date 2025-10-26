// import 'dart:convert';

// import 'package:injectable/injectable.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// @injectable
// class SqfLitePatient {
//   String databaseName = 'patients.db';
//   static Database? _db;

//   Future<Database?> get db async {
//     if (_db == null) {
//       _db = await intialDb();
//       return _db;
//     } else {
//       return _db;
//     }
//   }

//   intialDb() async {
//     String databasePath = await getDatabasesPath();
//     String path = join(databasePath, databaseName);
//     Database mydb = await openDatabase(path,
//         onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
//     return mydb;
//   }

//   _onUpgrade(Database db, int oldversion, int newversion) {
//     print("onUpgrade =====================================");
//   }

//   _onCreate(Database db, int version) async {
//     // جدول المرضى
//     await db.execute('''
//       CREATE TABLE patients (
//         id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
//         fullName TEXT NOT NULL,
//         age INTEGER NOT NULL,
//         firstDate TEXT,
//         phone TEXT NOT NULL,
//         note TEXT,
//         gender TEXT NOT NULL,
//         doctorId INTEGER NOT NULL,
//         serverId INTEGER NOT NULL
//       )
//     ''');

//     // جدول العمليات
//     await db.execute('''
//       CREATE TABLE operations (
//         id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
//         patientId INTEGER NOT NULL,
//         toothNumber INTEGER NOT NULL,
//         treatmentType TEXT NOT NULL,
//         totalCost REAL NOT NULL,
//         doctorId INTEGER NOT NULL,
//         startDate TEXT NOT NULL,
//         generalNote TEXT,
//         status INTEGER NOT NULL,
//         serverId INTEGER NOT NULL,
//         FOREIGN KEY (patientId) REFERENCES patients(id) ON DELETE CASCADE
//       )
//     ''');

//     // جدول الجلسات
//     await db.execute('''
//       CREATE TABLE sessions (
//         id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
//         operationId INTEGER NOT NULL,
//         sessionDate TEXT NOT NULL,
//         procedure TEXT NOT NULL,
//         doctorId INTEGER NOT NULL,
//         payment REAL,
//         note TEXT,
//         serverId INTEGER NOT NULL,
//         FOREIGN KEY (operationId) REFERENCES operations(id) ON DELETE CASCADE
//       )
//     ''');

//     // جدول المهمات المرسلة الى السيرفر
//     await db.execute('''
//       CREATE TABLE syncActions (
//         id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
//         tableName TEXT NOT NULL,
//         action INTEGER NOT NULL,
//         recordId INTEGER NOT NULL,
//         payload TEXT NOT NULL,
//         status INTEGER NOT NULL,
//         createdAt TEXT NOT NULL
//       )
//     ''');
//   }

//   // _____________________________________________________________________________
//   // CRUD عامة

//   /// إدخال سجل جديد
//   Future<int> insert(String table, Map<String, dynamic> values) async {
//     final mydb = await db;
//     int id = await mydb!.insert(table, values);
//     print(id);
//     print("id -----------------------------------------");
//     final row = await mydb!.query(table, where: "id = ?", whereArgs: [id]);
//     if (row.isNotEmpty) {
//       final Map<String, Object?> updatedRow = row.first;

//       await mydb.rawInsert(
//           'INSERT INTO syncActions(tableName, action,recordId,  payload, status, createdAt) VALUES(?, ?, ?, ?, ?, ?)',
//           [
//             table,
//             1,
//             id,
//             jsonEncode(updatedRow),
//             1,
//             DateTime.now().toIso8601String()
//           ]);
//     }
//     return id;
//   }

//   /// تحديث سجل
//   Future<int> update(
//     String table,
//     Map<String, dynamic> values, {
//     String? where,
//     List<Object?>? whereArgs,
//   }) async {
//     final mydb = await db;
//     print(values['id']);
//     print("values['id'] -----------------------------------------");
//     int result =
//         await mydb!.update(table, values, where: where, whereArgs: whereArgs);
//     if (result == 1) {
//       final row =
//           await mydb!.query(table, where: "id = ?", whereArgs: [values['id']]);
//       if (row.isNotEmpty) {
//         final Map<String, Object?> updatedRow = row.first;
//         // أو لو تريد Map<String, dynamic>:
//         // final Map<String, dynamic> updatedRowDynamic =
//         //     Map<String, dynamic>.from(updatedRow);
//         // سجل في جدول المزامنة:
//         await mydb.rawInsert(
//           'INSERT INTO syncActions(tableName, action,recordId,   payload, status, createdAt) VALUES(?,  ?,?, ?, ?, ?)',
//           [
//             table,
//             2, // update
//             values['id'],
//             jsonEncode(updatedRow),
//             1,
//             DateTime.now().toIso8601String(),
//           ],
//         );
//       }
//     }
//     return result;
//   }

//   /// تحديث سجل
//   // Future<int> updateServerId(
//   //   String table,
//   //   Map<String, dynamic> values, {
//   //   String? where,
//   //   List<Object?>? whereArgs,
//   // }) async {
//   //   final mydb = await db;
//   //   print(values['id']);
//   //   print("values['id'] -----------------------------------------");
//   //   int result =
//   //       await mydb!.update(table, values, where: where, whereArgs: whereArgs);
//   //   return result;
//   // }

//   /// حذف سجل
//   Future<int> delete(
//     String table, {
//     String? where,
//     List<Object?>? whereArgs,
//   }) async {
//     final mydb = await db;

//     final row = await mydb!.query(table, where: where, whereArgs: whereArgs);
//     if (row.isNotEmpty) {
//       final Map<String, Object?> updatedRow = row.first;
//       // سجل في جدول المزامنة:
//       await mydb.rawInsert(
//         'INSERT INTO syncActions(tableName, action,recordId, payload, status, createdAt) VALUES(?,  ?, ?, ?, ?, ?)',
//         [
//           table,
//           3, // delete
//           updatedRow['id'],
//           jsonEncode(updatedRow),
//           1,
//           DateTime.now().toIso8601String(),
//         ],
//       );
//     }
//     int result = await mydb!.delete(table, where: where, whereArgs: whereArgs);
//     return result;
//   }

//   /// قراءة بيانات
//   Future<List<Map<String, dynamic>>> read(
//     String table, {
//     String? where,
//     List<Object?>? whereArgs,
//     String? orderBy,
//     int? limit,
//   }) async {
//     final mydb = await db;
//     return await mydb!.query(
//       table,
//       where: where,
//       whereArgs: whereArgs,
//       orderBy: orderBy,
//       limit: limit,
//     );
//   }
//   // /////////////////////////////////////////////////////////

//   Future<int> updateServerId(
//     String table,
//     Map<String, dynamic> values, {
//     String? where,
//     List<Object?>? whereArgs,
//   }) async {
//     final mydb = await db;
//     int result =
//         await mydb!.update(table, values, where: where, whereArgs: whereArgs);
//     if (result == 1) {
//       await mydb.update(
//         "syncActions",
//         {"payload": jsonEncode(values), "status": 2},
//         where: "tableName = ? AND recordId = ?",
//         whereArgs: [table, values['id']],
//       );
//       await mydb.update(
//         table,
//         {"serverId": values['serverId']},
//         where: "id = ?",
//         whereArgs: [values['id']],
//       );
//     }
//     return result;
//   }

//   Future<int> updateStatus(
//     String table,
//     Map<String, dynamic> values, {
//     String? where,
//     List<Object?>? whereArgs,
//   }) async {
//     final mydb = await db;
//     int result =
//         await mydb!.update(table, values, where: where, whereArgs: whereArgs);
//     return result;
//   }

//   // _____________________________________________________________________________
//   Future<void> dropTablesAndRecreate() async {
//     String databasePath = await getDatabasesPath();
//     String path = join(databasePath, databaseName);
//     Database db = await openDatabase(path, version: 1);

//     await db.execute("DROP TABLE IF EXISTS sessions");
//     await db.execute("DROP TABLE IF EXISTS operations");
//     await db.execute("DROP TABLE IF EXISTS patients");
//     await db.execute("DROP TABLE IF EXISTS syncActions");

//     await _onCreate(db, 1);
//     print("DropTablesAndRecreate =====================================");
//   }
// }
