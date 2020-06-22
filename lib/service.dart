import 'package:http/http.dart' as http;
import 'users.dart';
class Services{
  static const String url = "http://jsonplaceholder.typicode.com/users";
  // đường link file json.

  static Future<List<User>> getUsers() async { // đọc đường link json và lấy user
    try {
      final response = await http.get(url); // đọc đường link file json.
      if(200 == response.statusCode){ // nếu mã trạng thái là 200 thì chúng tôi sẽ đi vào trong phân tích dữ liệu.
        final List<User> users = userFromJson(response.body);
        return users; // trả về danh sách user.
      }else{
        // nếu không thì trả về danh sách user null.
         return List<User>();
      }
    } catch (e) {
      return List<User>();
    }
  }
}