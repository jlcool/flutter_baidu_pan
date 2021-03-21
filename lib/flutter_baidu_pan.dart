library flutter_baidu_pan;

import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_baidu_pan/response/baidu_pan_multimedia_response.dart';
import 'package:url_launcher/url_launcher.dart';

import 'response/baidu_pan_list_response.dart';
import 'response/baidu_pan_listall_response.dart';
import 'response/baidu_pan_uinfo_response.dart';

/// 百度网盘
class BaiduPan {
  Dio _dio = Dio();
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
  Future<BaiduPanListAllResponse> listall(String token,
      {String path,
      String order,
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
    if (par != null) {
      par += "&web=$web";
    }
    String url =
        "https://pan.baidu.com/rest/2.0/xpan/multimedia?method=listall&access_token=$token$par";
    var result = await _dio.get(url);
    return BaiduPanListAllResponse.fromJson(result.data);
  }

  Future<BaiduPanMultimediaResponse> multimedia(String token, int fsid) async {
    var result = await _dio.get(
        "https://pan.baidu.com/rest/2.0/xpan/multimedia?method=filemetas&fsids=[$fsid]&dlink=1&access_token=$token");
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
}
