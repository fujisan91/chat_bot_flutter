import 'package:chatbot/configs/appConstants.dart';

class GetNobyRequest {
  String inputMessage;
  GetNobyRequest(this.inputMessage);

  dynamic toJson() => {"text": this.inputMessage};
}