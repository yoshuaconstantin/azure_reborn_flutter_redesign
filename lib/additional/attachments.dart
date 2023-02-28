import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:dio/dio.dart';

import '../api/api_manager.dart';


class Attachment {
  int? id;
  String? url;
  Uint8List? raw;

  Attachment({
    this.id,
    this.url,
    this.raw
  });

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
      id: json['id'],
      url: json['url']
  );
}

// class Attachments {
//   static Future<int> upload({
//     required Attachment attachment,
//     required String module
//   }) async {
//     List<String> mimeType = StringUtils.defaultString(
//         lookupMimeType("", headerBytes: attachment.raw!), defaultStr: "*/*")
//         .split("/");
//
//     Response response = await ApiManager().uploadUrl(
//         type: mimeType[0],
//         format: mimeType[1],
//         module: module,
//         filename: "${DateTime
//             .now()
//             .microsecondsSinceEpoch
//             .toString()}.${mimeType[1]}",
//         fileId: attachment.id
//     );
//
//     if (response.statusCode == 200) {
//       UploadUrlResponse uploadUrlResponse = UploadUrlResponse.fromJson(
//           response.data);
//
//       Response uploadResponse = await ApiManager().uploadFile(
//           signedUrl: uploadUrlResponse.signedUrl,
//           contentType: "${mimeType[0]}/${mimeType[1]}",
//           bytes: attachment.raw!
//       );
//
//       if (uploadResponse.statusCode == 200) {
//         return uploadUrlResponse.fileId;
//       }
//     }
//
//     throw Error();
//   }
// }