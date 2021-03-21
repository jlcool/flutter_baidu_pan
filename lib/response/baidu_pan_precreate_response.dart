class BaiduPanPrecreateResponse {
  String path;
  String uploadid;
  int returnType;
  List<int> blockList;
  int errno;
  int requestId;

  BaiduPanPrecreateResponse(
      {this.path,
      this.uploadid,
      this.returnType,
      this.blockList,
      this.errno,
      this.requestId});

  BaiduPanPrecreateResponse.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    uploadid = json['uploadid'];
    returnType = json['return_type'];
    blockList = json['block_list']?.cast<int>();
    errno = json['errno'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['uploadid'] = this.uploadid;
    data['return_type'] = this.returnType;
    data['block_list'] = this.blockList;
    data['errno'] = this.errno;
    data['request_id'] = this.requestId;
    return data;
  }
}