class BaiduPanUinfoResponse {
  String avatarUrl;
  String baiduName;
  String errmsg;
  int errno;
  String netdiskName;
  String requestId;
  int uk;
  int vipType;

  BaiduPanUinfoResponse(
      {this.avatarUrl,
      this.baiduName,
      this.errmsg,
      this.errno,
      this.netdiskName,
      this.requestId,
      this.uk,
      this.vipType});

  BaiduPanUinfoResponse.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
    baiduName = json['baidu_name'];
    errmsg = json['errmsg'];
    errno = json['errno'];
    netdiskName = json['netdisk_name'];
    requestId = json['request_id'];
    uk = json['uk'];
    vipType = json['vip_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this.avatarUrl;
    data['baidu_name'] = this.baiduName;
    data['errmsg'] = this.errmsg;
    data['errno'] = this.errno;
    data['netdisk_name'] = this.netdiskName;
    data['request_id'] = this.requestId;
    data['uk'] = this.uk;
    data['vip_type'] = this.vipType;
    return data;
  }
}