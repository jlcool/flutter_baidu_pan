library flutter_baidu_pan;

import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_baidu_pan/response/baidu_pan_multimedia_response.dart';
import 'package:flutter_baidu_pan/response/baidu_pan_precreate_response.dart';
import 'package:flutter_baidu_pan/response/baidu_pan_upload_response.dart';
import 'package:url_launcher/url_launcher.dart';

import 'response/baidu_pan_create_response.dart';
import 'response/baidu_pan_list_response.dart';
import 'response/baidu_pan_listall_response.dart';
import 'response/baidu_pan_share_list_response.dart';
import 'response/baidu_pan_share_set_response.dart';
import 'response/baidu_pan_uinfo_response.dart';
import 'package:path/path.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

/// 百度网盘
class BaiduPan {
  Dio _dio = Dio();
  // BaiduPan() {
  //   (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //       (client) {
  //     client.findProxy = (url) {
  //       ///设置代理 电脑ip地址
  //       return "PROXY 192.168.1.104:8888";

  //       ///不设置代理
  //       // return 'DIRECT';
  //     };

  //     ///忽略证书
  //     client.badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  //   };
  // }
  //签名
  String _csign(String fidList, String thirdType, String secret,
      {int schannel = 0}) {
    var content =
        new Utf8Encoder().convert('$thirdType$fidList$schannel$secret');
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  //获取用户信息
  Future<BaiduPanUinfoResponse> uinfo(String token) async {
    String url =
        "https://pan.baidu.com/rest/2.0/xpan/nas?method=uinfo&access_token=$token";
    var result = await _dio.get(url);
    return BaiduPanUinfoResponse.fromJson(result.data);
  }

  /// 打开浏览器授权
  Future authorize(String clientId, String redirectUri) => launch(
      'http://openapi.baidu.com/oauth/2.0/authorize?response_type=token&client_id=' +
          clientId +
          '&redirect_uri=' +
          redirectUri +
          '&scope=netdisk&display=mobile&state=${DateTime.now().millisecondsSinceEpoch}');

  ///获取文件列表
  ///https://pan.baidu.com/union/document/basic#%E8%8E%B7%E5%8F%96%E6%96%87%E4%BB%B6%E5%88%97%E8%A1%A8
  Future<BaiduPanListResponse> list(String token,
      {String dir,
      String order,
      String desc,
      int start,
      int limit,
      String web,
      int folder,
      int showempty}) async {
    String par = "";
    if (dir != null) {
      par += "&dir=${Uri.encodeComponent(dir)}";
    }
    if (order != null) {
      par += "&order=$order";
    }
    if (desc != null) {
      par += "&desc=$desc";
    }
    if (start != null) {
      par += "&start=$start";
    }
    if (limit != null) {
      par += "&limit=$limit";
    }
    if (web != null) {
      web += "&web=$web";
    }
    if (folder != null) {
      par += "&folder=$folder";
    }
    if (showempty != null) {
      par += "&showempty=$showempty";
    }
    String url =
        "https://pan.baidu.com/rest/2.0/xpan/file?method=list&access_token=$token$par";
    var result = await _dio.get(url);
    return BaiduPanListResponse.fromJson(result.data);
  }

  ///获取文件列表
  ///recursion 是否递归
  ///https://pan.baidu.com/union/document/basic#%E8%8E%B7%E5%8F%96%E6%96%87%E4%BB%B6%E5%88%97%E8%A1%A8
  Future<BaiduPanListAllResponse> listall(String token, String path,
      {String order,
      String desc,
      int start,
      int limit,
      int recursion,
      int ctime,
      int mtime,
      int web}) async {
    String par = "";
    if (path != null) {
      par += "&path=${Uri.encodeComponent(path)}";
    }
    if (order != null) {
      par += "&order=$order";
    }
    if (desc != null) {
      par += "&desc=$desc";
    }
    if (start != null) {
      par += "&start=$start";
    }
    if (limit != null) {
      par += "&limit=$limit";
    }
    if (recursion != null) {
      par += "&recursion=$recursion";
    }
    if (ctime != null) {
      par += "&ctime=$ctime";
    }
    if (mtime != null) {
      par += "&mtime=$mtime";
    }
    if (web != null) {
      par += "&web=$web";
    }
    String url =
        "https://pan.baidu.com/rest/2.0/xpan/multimedia?method=listall&access_token=$token$par";
    var result = await _dio.get(url);
    return BaiduPanListAllResponse.fromJson(result.data);
  }

  Future<BaiduPanMultimediaResponse> multimedia(String token, String fsid,
      {int dlink = 1, int thumb = 1}) async {
    var result = await _dio.get(
        "https://pan.baidu.com/rest/2.0/xpan/multimedia?method=filemetas&fsids=[$fsid]&dlink=$dlink&thumb=$thumb&access_token=$token");
    return BaiduPanMultimediaResponse.fromJson(result.data);
  }

  Future download(String token, String dlink, String savePath,
      {ProgressCallback onReceiveProgress}) async {
    await _dio.download("$dlink&access_token=$token", savePath,
        onReceiveProgress: onReceiveProgress,
        options: Options(headers: {"User-Agent": "pan.baidu.com"}));
  }

  Future<Uint8List> getFile(String token, String dlink) async {
    var response = await _dio.get("$dlink&access_token=$token",
        options: Options(
            headers: {"User-Agent": "pan.baidu.com"},
            responseType: ResponseType.bytes));
    return response.data;
  }

  ///预上传
  ///rtype 文件命名策略，默认0
  // 0 为不重命名，返回冲突
  // 1 为只要path冲突即重命名
  // 2 为path冲突且block_list不同才重命名
  // 3 为覆盖
  Future<BaiduPanPrecreateResponse> precreate(
      String token, List<String> blockList, String savePath, int size,{isdir=0,rtype=0}) async {
    var data =
        'path=${Uri.encodeComponent(savePath)}&isdir=$isdir&autoinit=1&size=$size&rtype=$rtype&block_list=${Uri.encodeComponent("[\"${blockList.join("\",\"")}\"]")}';
    var result = await _dio.post(
        "https://pan.baidu.com/rest/2.0/xpan/file?method=precreate&access_token=$token",
        data: data);
    return BaiduPanPrecreateResponse.fromJson(result.data);
  }

  //上传
  Future<BaiduPanUploadResponse> upload(
      String token, String savePath, int size, String uploadid,
      {String filePath, List<int> bytes}) async {
    assert(filePath != null || bytes != null);
    FormData formData = FormData.fromMap({
      "file": filePath == null
          ? MultipartFile.fromBytes(bytes, filename: basename(savePath))
          : await MultipartFile.fromFile(filePath, filename: basename(savePath))
    });

    var result = await _dio.post(
        "https://d.pcs.baidu.com/rest/2.0/pcs/superfile2?method=upload&access_token=$token&type=tmpfile&path=${Uri.encodeComponent(savePath)}&uploadid=$uploadid&partseq=0",
        data: formData);
    if (result.data is String) {
      return BaiduPanUploadResponse.fromJson(jsonDecode(result.data));
    }
    return BaiduPanUploadResponse.fromJson(result.data);
  }

  //创建文件
  Future<BaiduPanCreateResponse> create(String token, String savePath, int size,
      List<String> blockList, String uploadid,
      {int rtype = 1}) async {
    var data =
        "path=${Uri.encodeComponent(savePath)}&size=$size&isdir=0&rtype=$rtype&uploadid=$uploadid&block_list=${Uri.encodeComponent("[\"${blockList.join("\",\"")}\"]")}";
    var result = await _dio.post(
        "https://pan.baidu.com/rest/2.0/xpan/file?method=create&access_token=$token",
        data: data,
        options: Options(headers: {"User-Agent": "pan.baidu.com"}));
    return BaiduPanCreateResponse.fromJson(result.data);
  }

  //创建分享
  Future<BaiduPanShareSetResponse> shareSet(
      String token, String fidList, int schannel, int period, int thirdType,
      {String description = ""}) async {
    var csign = _csign(fidList, '', '');
    var data =
        "fidList=${Uri.encodeComponent(fidList)}&schannel=$schannel&period=$period&thirdType=$thirdType&csign=$csign&description=$description";
    var result = await _dio.post(
        "https://pan.baidu.com/rest/2.0/xpan/share/set&access_token=$token",
        data: data);
    return BaiduPanShareSetResponse.fromJson(result.data);
  }

  //创建分享
  Future<BaiduPanShareListResponse> shareList(
      {int shareid,
      int uk,
      String shorturl,
      int page,
      int num,
      int root,
      int fid,
      String sekey}) async {
    assert((shareid != null && uk != null) || shorturl != null);
    var querystring = {
      "method": "list",
      "shareid": shareid,
      "uk": uk,
      "shorturl":Uri.encodeComponent(shorturl),
      "page": page,
      "num": num,
      "root": root,
      "fid": fid,
      "sekey": sekey
    };

    var result = await _dio.get("https://pan.baidu.com/rest/2.0/xpan/share",
        queryParameters: querystring);
    return BaiduPanShareListResponse.fromJson(result.data);
  }
}
