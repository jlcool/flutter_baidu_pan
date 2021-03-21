class BaiduPanSearchResponse {
  int errno;
  List<BaiduPanSearchList> list;
  int requestId;
  int hasMore;

  BaiduPanSearchResponse(
      {this.errno, this.list, this.requestId, this.hasMore});

  BaiduPanSearchResponse.fromJson(Map<String, dynamic> json) {
    errno = json['errno'];
    if (json['list'] != null) {
      list = new List<BaiduPanSearchList>();
      json['list'].forEach((v) {
        list.add(new BaiduPanSearchList.fromJson(v));
      });
    }
    requestId = json['request_id'];
  
    hasMore = json['has_more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errno'] = this.errno;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['request_id'] = this.requestId;
  
    data['has_more'] = this.hasMore;
    return data;
  }
}

class BaiduPanSearchList {
  int fsId;
  String path;
  String serverFilename;
  int size;
  int serverMtime;
  int serverCtime;
  int localMtime;
  int localCtime;
  int isdir;
  int category;
  int share;
  int operId;
  int extentTinyint1;
  int wpfile;
  String md5;

  BaiduPanSearchList(
      {this.fsId,
      this.path,
      this.serverFilename,
      this.size,
      this.serverMtime,
      this.serverCtime,
      this.localMtime,
      this.localCtime,
      this.isdir,
      this.category,
      this.share,
      this.operId,
      this.extentTinyint1,
      this.wpfile,
      this.md5});

  BaiduPanSearchList.fromJson(Map<String, dynamic> json) {
    fsId = json['fs_id'];
    path = json['path'];
    serverFilename = json['server_filename'];
    size = json['size'];
    serverMtime = json['server_mtime'];
    serverCtime = json['server_ctime'];
    localMtime = json['local_mtime'];
    localCtime = json['local_ctime'];
    isdir = json['isdir'];
    category = json['category'];
    share = json['share'];
    operId = json['oper_id'];
    extentTinyint1 = json['extent_tinyint1'];
    wpfile = json['wpfile'];
    md5 = json['md5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fs_id'] = this.fsId;
    data['path'] = this.path;
    data['server_filename'] = this.serverFilename;
    data['size'] = this.size;
    data['server_mtime'] = this.serverMtime;
    data['server_ctime'] = this.serverCtime;
    data['local_mtime'] = this.localMtime;
    data['local_ctime'] = this.localCtime;
    data['isdir'] = this.isdir;
    data['category'] = this.category;
    data['share'] = this.share;
    data['oper_id'] = this.operId;
    data['extent_tinyint1'] = this.extentTinyint1;
    data['wpfile'] = this.wpfile;
    data['md5'] = this.md5;
    return data;
  }
}