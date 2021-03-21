class BaiduPanListResponse {
  int errno;
  String guidInfo;
  List<FileList> fileList;
  String requestId;
  int guid;

  BaiduPanListResponse(
      {this.errno, this.guidInfo, this.fileList, this.requestId, this.guid});

  BaiduPanListResponse.fromJson(Map<String, dynamic> json) {
    errno = json['errno'];
    guidInfo = json['guid_info'];
    if (json['list'] != null) {
      fileList = new List<FileList>();
      json['list'].forEach((v) {
        fileList.add(new FileList.fromJson(v));
      });
    }
    requestId = json['request_id'].toString();
    guid = json['guid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errno'] = this.errno;
    data['guid_info'] = this.guidInfo;
    if (this.fileList != null) {
      data['list'] = this.fileList.map((v) => v.toJson()).toList();
    }
    data['request_id'] = this.requestId;
    data['guid'] = this.guid;
    return data;
  }
}

class FileList {
  String serverFilename;
  int privacy;
  int category;
  int unlist;
  int fsId;
  int dirEmpty;
  int serverAtime;
  int serverCtime;
  int localMtime;
  int size;
  int isdir;
  int share;
  String path;
  int localCtime;
  int serverMtime;
  int empty;
  int operId;
  Thumbs thumbs;
  String md5;

  FileList(
      {this.serverFilename,
      this.privacy,
      this.category,
      this.unlist,
      this.fsId,
      this.dirEmpty,
      this.serverAtime,
      this.serverCtime,
      this.localMtime,
      this.size,
      this.isdir,
      this.share,
      this.path,
      this.localCtime,
      this.serverMtime,
      this.empty,
      this.operId,
      this.thumbs,
      this.md5});

  FileList.fromJson(Map<String, dynamic> json) {
    serverFilename = json['server_filename'];
    privacy = json['privacy'];
    category = json['category'];
    unlist = json['unlist'];
    fsId = json['fs_id'];
    dirEmpty = json['dir_empty'];
    serverAtime = json['server_atime'];
    serverCtime = json['server_ctime'];
    localMtime = json['local_mtime'];
    size = json['size'];
    isdir = json['isdir'];
    share = json['share'];
    path = json['path'];
    localCtime = json['local_ctime'];
    serverMtime = json['server_mtime'];
    empty = json['empty'];
    operId = json['oper_id'];
    thumbs =
        json['thumbs'] != null ? new Thumbs.fromJson(json['thumbs']) : null;
    md5 = json['md5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['server_filename'] = this.serverFilename;
    data['privacy'] = this.privacy;
    data['category'] = this.category;
    data['unlist'] = this.unlist;
    data['fs_id'] = this.fsId;
    data['dir_empty'] = this.dirEmpty;
    data['server_atime'] = this.serverAtime;
    data['server_ctime'] = this.serverCtime;
    data['local_mtime'] = this.localMtime;
    data['size'] = this.size;
    data['isdir'] = this.isdir;
    data['share'] = this.share;
    data['path'] = this.path;
    data['local_ctime'] = this.localCtime;
    data['server_mtime'] = this.serverMtime;
    data['empty'] = this.empty;
    data['oper_id'] = this.operId;
    if (this.thumbs != null) {
      data['thumbs'] = this.thumbs.toJson();
    }
    data['md5'] = this.md5;
    return data;
  }
}

class Thumbs {
  String url3;
  String url2;
  String url1;

  Thumbs({this.url3, this.url2, this.url1});

  Thumbs.fromJson(Map<String, dynamic> json) {
    url3 = json['url3'];
    url2 = json['url2'];
    url1 = json['url1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url3'] = this.url3;
    data['url2'] = this.url2;
    data['url1'] = this.url1;
    return data;
  }
}