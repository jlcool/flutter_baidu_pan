class BaiduPanListAllResponse {
  int cursor;
  String errmsg;
  int errno;
  int hasMore;
  List<FileList> fileList;
  String requestId;

  BaiduPanListAllResponse(
      {this.cursor,
      this.errmsg,
      this.errno,
      this.hasMore,
      this.fileList,
      this.requestId});

  BaiduPanListAllResponse.fromJson(Map<String, dynamic> json) {
    cursor = json['cursor'];
    errmsg = json['errmsg'];
    errno = json['errno'];
    hasMore = json['has_more'];
    if (json['list'] != null) {
      fileList = new List<FileList>();
      json['list'].forEach((v) {
        fileList.add(new FileList.fromJson(v));
      });
    }
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cursor'] = this.cursor;
    data['errmsg'] = this.errmsg;
    data['errno'] = this.errno;
    data['has_more'] = this.hasMore;
    if (this.fileList != null) {
      data['list'] = this.fileList.map((v) => v.toJson()).toList();
    }
    data['request_id'] = this.requestId;
    return data;
  }
}

class FileList {
  int category;
  int fsId;
  int isdir;
  int localCtime;
  int localMtime;
  String md5;
  String path;
  int serverCtime;
  String serverFilename;
  int serverMtime;
  int size;
  Thumbs thumbs;

  FileList(
      {this.category,
      this.fsId,
      this.isdir,
      this.localCtime,
      this.localMtime,
      this.md5,
      this.path,
      this.serverCtime,
      this.serverFilename,
      this.serverMtime,
      this.size,
      this.thumbs});

  FileList.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    fsId = json['fs_id'];
    isdir = json['isdir'];
    localCtime = json['local_ctime'];
    localMtime = json['local_mtime'];
    md5 = json['md5'];
    path = json['path'];
    serverCtime = json['server_ctime'];
    serverFilename = json['server_filename'];
    serverMtime = json['server_mtime'];
    size = json['size'];
    thumbs =
        json['thumbs'] != null ? new Thumbs.fromJson(json['thumbs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['fs_id'] = this.fsId;
    data['isdir'] = this.isdir;
    data['local_ctime'] = this.localCtime;
    data['local_mtime'] = this.localMtime;
    data['md5'] = this.md5;
    data['path'] = this.path;
    data['server_ctime'] = this.serverCtime;
    data['server_filename'] = this.serverFilename;
    data['server_mtime'] = this.serverMtime;
    data['size'] = this.size;
    if (this.thumbs != null) {
      data['thumbs'] = this.thumbs.toJson();
    }
    return data;
  }
}

class Thumbs {
  String url1;
  String url2;
  String url3;
  String icon;

  Thumbs({this.url1, this.url2, this.url3, this.icon});

  Thumbs.fromJson(Map<String, dynamic> json) {
    url1 = json['url1'];
    url2 = json['url2'];
    url3 = json['url3'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url1'] = this.url1;
    data['url2'] = this.url2;
    data['url3'] = this.url3;
    data['icon'] = this.icon;
    return data;
  }
}