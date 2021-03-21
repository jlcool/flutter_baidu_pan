class BaiduPanMultimediaResponse {
  String errmsg;
  int errno;
  List<BaiduPanMultimediaList> list;
  String requestId;

  BaiduPanMultimediaResponse(
      {this.errmsg, this.errno, this.list, this.requestId});

  BaiduPanMultimediaResponse.fromJson(Map<String, dynamic> json) {
    errmsg = json['errmsg'];
    errno = json['errno'];
    if (json['list'] != null) {
      list = new List<BaiduPanMultimediaList>();
      json['list'].forEach((v) {
        list.add(new BaiduPanMultimediaList.fromJson(v));
      });
    }
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errmsg'] = this.errmsg;
    data['errno'] = this.errno;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['request_id'] = this.requestId;
    return data;
  }
}

class BaiduPanMultimediaList {
  int category;
  String dlink;
  String filename;
  int fsId;
  int isdir;
  String md5;
  int operId;
  String path;
  int serverCtime;
  int serverMtime;
  int size;

  BaiduPanMultimediaList(
      {this.category,
      this.dlink,
      this.filename,
      this.fsId,
      this.isdir,
      this.md5,
      this.operId,
      this.path,
      this.serverCtime,
      this.serverMtime,
      this.size});

  BaiduPanMultimediaList.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    dlink = json['dlink'];
    filename = json['filename'];
    fsId = json['fs_id'];
    isdir = json['isdir'];
    md5 = json['md5'];
    operId = json['oper_id'];
    path = json['path'];
    serverCtime = json['server_ctime'];
    serverMtime = json['server_mtime'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['dlink'] = this.dlink;
    data['filename'] = this.filename;
    data['fs_id'] = this.fsId;
    data['isdir'] = this.isdir;
    data['md5'] = this.md5;
    data['oper_id'] = this.operId;
    data['path'] = this.path;
    data['server_ctime'] = this.serverCtime;
    data['server_mtime'] = this.serverMtime;
    data['size'] = this.size;
    return data;
  }
}