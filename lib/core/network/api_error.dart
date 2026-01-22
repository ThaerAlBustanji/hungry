class ApiError {
  final String massege;
  final int?  statuscode;
  ApiError({required this.massege , this.statuscode});

  String tostring(){
    return"error is $massege(statuscode is $statuscode)";
  }
 
}




