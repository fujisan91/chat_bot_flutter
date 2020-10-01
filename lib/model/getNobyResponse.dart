class GetNobyResponse {
  String nobyMessage;
  GetNobyResponse(this.nobyMessage);

  dynamic fromJson() => {"text": this.nobyMessage};
}