class BaiduPanMultimediaResponse {
  String errmsg;
  int errno;
  List<FileList> list;
  String requestId;

  BaiduPanMultimediaResponse(
      {this.errmsg, this.errno, this.list, this.requestId});

  BaiduPanMultimediaResponse.fromJson(Map<String, dynamic> json) {
    errmsg = json['errmsg'];
    errno = json['errno'];
    if (json['list'] != null) {
      list = new List<FileList>();
      json['list'].forEach((v) {
        list.add(new FileList.fromJson(v));
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

class FileList {
  int category;
  int dateTaken;
  String dlink;
  String filename;
  int fsId;
  int height;
  int isdir;
  String md5;
  int operId;
  String path;
  int serverCtime;
  int serverMtime;
  int size;
  Thumbs thumbs;
  int width;

  FileList(
      {this.category,
      this.dateTaken,
      this.dlink,
      this.filename,
      this.fsId,
      this.height,
      this.isdir,
      this.md5,
      this.operId,
      this.path,
      this.serverCtime,
      this.serverMtime,
      this.size,
      this.thumbs,
      this.width});

  FileList.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    dateTaken = json['date_taken'];
    dlink = json['dlink'];
    filename = json['filename'];
    fsId = json['fs_id'];
    height = json['height'];
    isdir = json['isdir'];
    md5 = json['md5'];
    operId = json['oper_id'];
    path = json['path'];
    serverCtime = json['server_ctime'];
    serverMtime = json['server_mtime'];
    size = json['size'];
    thumbs =
        json['thumbs'] != null ? new Thumbs.fromJson(json['thumbs']) : null;
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['date_taken'] = this.dateTaken;
    data['dlink'] = this.dlink;
    data['filename'] = this.filename;
    data['fs_id'] = this.fsId;
    data['height'] = this.height;
    data['isdir'] = this.isdir;
    data['md5'] = this.md5;
    data['oper_id'] = this.operId;
    data['path'] = this.path;
    data['server_ctime'] = this.serverCtime;
    data['server_mtime'] = this.serverMtime;
    data['size'] = this.size;
    if (this.thumbs != null) {
      data['thumbs'] = this.thumbs.toJson();
    }
    data['width'] = this.width;
    return data;
  }
}

class Thumbs {
  String icon;
  String url1;
  String url2;
  String url3;

  Thumbs({this.icon, this.url1, this.url2, this.url3});

  Thumbs.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    url1 = json['url1'];
    url2 = json['url2'];
    url3 = json['url3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['url1'] = this.url1;
    data['url2'] = this.url2;
    data['url3'] = this.url3;
    return data;
  }
}