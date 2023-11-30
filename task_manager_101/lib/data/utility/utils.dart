import 'package:task_manager_101/ui/widget/task_item_card.dart';

class Urls{
   
  static const String  _baseUrl = 'https://task.teamrabbil.com/api/v1';
  static const String  registration = '$_baseUrl/registration';
  static const String login = '$_baseUrl/login';
  static const String createNewTask = '$_baseUrl/createTask';
  static String getNewTask = '$_baseUrl/listTaskByStatus/${TaskStatus.New.name}';
  static String getProgressTask = '$_baseUrl/listTaskByStatus/${TaskStatus.Progress.name}';
  static String getCompletedTask = '$_baseUrl/listTaskByStatus/${TaskStatus.Completed.name}';
  static String getCancelledTask = '$_baseUrl/listTaskByStatus/${TaskStatus.Cancelled.name}';

  static const String getStatusCount = '$_baseUrl/taskStatusCount';
  static   String  updateTaskStatus(String taskId,String status) =>'$_baseUrl/updateTaskStatus/$taskId/$status';
  static   String  delateTaskStatus(String taskId) =>'$_baseUrl/deleteTask/$taskId';

 // String base_url = 'https://api.themoviedb.org/3/';
}