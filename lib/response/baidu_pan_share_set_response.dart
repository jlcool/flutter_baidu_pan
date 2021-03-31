class BaiduPanShareSetResponse {
  int errno;
  int requestId;
  int shareid;
  String link;
  String shorturl;
  int ctime;
  int expiredType;
  bool premis;
  String pwd;
  int uk;

  BaiduPanShareSetResponse(
      {this.errno,
      this.requestId,
      this.shareid,
      this.link,
      this.shorturl,
      this.ctime,
      this.expiredType,
      this.premis,
      this.pwd,
      this.uk});

  BaiduPanShareSetResponse.fromJson(Map<String, dynamic> json) {
    errno = json['errno'];
    requestId = json['request_id'];
    shareid = json['shareid'];
    link = json['link'];
    shorturl = json['shorturl'];
    ctime = json['ctime'];
    expiredType = json['expiredType'];
    premis = json['premis'];
    pwd = json['pwd'];
    uk = json['uk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errno'] = this.errno;
    data['request_id'] = this.requestId;
    data['shareid'] = this.shareid;
    data['link'] = this.link;
    data['shorturl'] = this.shorturl;
    data['ctime'] = this.ctime;
    data['expiredType'] = this.expiredType;
    data['premis'] = this.premis;
    data['pwd'] = this.pwd;
    data['uk'] = this.uk;
    return data;
  }
}