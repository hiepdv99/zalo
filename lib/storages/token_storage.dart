import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TokenStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  //load file
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/token.txt');
  }
  //đọc dữ liệu
  Future<String> readToken() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '' ;
    }
  }
  //viết thêm dữ liệu vào
  Future<File> writeToken(String counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
  // xóa file
  Future<int> deleteFile() async{
    try{
      final file = await _localFile;
      await file.delete();
    }catch(e){
      return 0;
    }
  }
}

class NumberPhoneStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  //load file
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/numberphone.txt');
  }
  //đọc dữ liệu
  Future<String> readNumberPhone() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '' ;
    }
  }
  //viết thêm dữ liệu vào
  Future<File> writeNumberPhone(String numberPhone) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$numberPhone');
  }
  // xóa file
  Future<int> deleteFile() async{
    try{
      final file = await _localFile;
      await file.delete();
    }catch(e){
      return 0;
    }
  }
}