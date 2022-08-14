class ErrorMessageModel {
  final int statusCode;
  final String statusMessage;
  final bool success;


  ErrorMessageModel({required this.statusCode,required this.statusMessage,required this.success});


  factory ErrorMessageModel.fromApp(Map<String,dynamic> map) {
    return ErrorMessageModel(
        statusCode: map['status_code'] ,
        statusMessage: map['status_message'] ,
        success: map['success']
    );
  }

  
}