class Urls{
   
  static const String  _baseUrl = 'https://task.teamrabbil.com/api/v1';
  static const String  registration = '$_baseUrl/registration';
  static const String login = '$_baseUrl/login';
  static const String createNewTask = '$_baseUrl/createTask';
  static const String getNewTask = '$_baseUrl/listTaskByStatus/New';
  static const String getStatusCount = '$_baseUrl/taskStatusCount';
  static   String  updateTaskStatus(String taskId,String status) =>'$_baseUrl/updateTaskStatus/$taskId/$status';

 // String base_url = 'https://api.themoviedb.org/3/';
}