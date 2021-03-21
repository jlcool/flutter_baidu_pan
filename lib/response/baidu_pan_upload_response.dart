class BaiduPanUploadResponse {
  String md5;
  int requestId;

  BaiduPanUploadResponse({this.md5, this.requestId});

  BaiduPanUploadResponse.fromJson(Map<String, dynamic> json) {
    md5 = json['md5'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['md5'] = this.md5;
    data['request_id'] = this.requestId;
    return data;
  }
}