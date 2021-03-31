class BaiduPanShareListResponse {
  int errno;
  int requestId;
  int serverTime;
  int cfromId;
  String title;
  List<FileList> fileList;
  int shareId;
  int uk;

  BaiduPanShareListResponse(
      {this.errno,
      this.requestId,
      this.serverTime,
      this.cfromId,
      this.title,
      this.fileList,
      this.shareId,
      this.uk});

  BaiduPanShareListResponse.fromJson(Map<String, dynamic> json) {
    errno = json['errno'];
    requestId = json['request_id'];
    serverTime = json['server_time'];
    cfromId = json['cfrom_id'];
    title = json['title'];
    if (json['list'] != null) {
      fileList = new List<FileList>();
      json['list'].forEach((v) {
        fileList.add(new FileList.fromJson(v));
      });
    }
    shareId = json['share_id'];
    uk = json['uk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errno'] = this.errno;
    data['request_id'] = this.requestId;
    data['server_time'] = this.serverTime;
    data['cfrom_id'] = this.cfromId;
    data['title'] = this.title;
    if (this.fileList != null) {
      data['list'] = this.fileList.map((v) => v.toJson()).toList();
    }
    data['share_id'] = this.shareId;
    data['uk'] = this.uk;
    return data;
  }
}

class FileList {
  String category;
  String fsId;
  String isdir;
  String localCtime;
  String localMtime;
  String md5;
  String path;
  String serverCtime;
  String serverFilename;
  String serverMtime;
  String size;
  Thumbs thumbs;
  String docpreview;

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
      this.thumbs,
      this.docpreview});

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
    docpreview = json['docpreview'];
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
    data['docpreview'] = this.docpreview;
    return data;
  }
}

class Thumbs {
  String url1;
  String url3;

  Thumbs({this.url1, this.url3});

  Thumbs.fromJson(Map<String, dynamic> json) {
    url1 = json['url1'];
    url3 = json['url3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url1'] = this.url1;
    data['url3'] = this.url3;
    return data;
  }
}