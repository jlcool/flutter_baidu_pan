class BaiduPanCreateResponse {
  int errno;
  int fsId;
  String md5;
  String serverFilename;
  int category;
  String path;
  int size;
  int ctime;
  int mtime;
  int isdir;
  String name;

  BaiduPanCreateResponse(
      {this.errno,
      this.fsId,
      this.md5,
      this.serverFilename,
      this.category,
      this.path,
      this.size,
      this.ctime,
      this.mtime,
      this.isdir,
      this.name});

  BaiduPanCreateResponse.fromJson(Map<String, dynamic> json) {
    errno = json['errno'];
    fsId = json['fs_id'];
    md5 = json['md5'];
    serverFilename = json['server_filename'];
    category = json['category'];
    path = json['path'];
    size = json['size'];
    ctime = json['ctime'];
    mtime = json['mtime'];
    isdir = json['isdir'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errno'] = this.errno;
    data['fs_id'] = this.fsId;
    data['md5'] = this.md5;
    data['server_filename'] = this.serverFilename;
    data['category'] = this.category;
    data['path'] = this.path;
    data['size'] = this.size;
    data['ctime'] = this.ctime;
    data['mtime'] = this.mtime;
    data['isdir'] = this.isdir;
    data['name'] = this.name;
    return data;
  }
}