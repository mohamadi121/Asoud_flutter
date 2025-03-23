import 'dart:io';

import 'package:asood/features/inquiry/data/data_source/inquiry_api_service.dart';

class InquiryRepo {
  final InquiryAPIService inquiryApiService = InquiryAPIService();

  Future<dynamic> submitInquiry(
    String inquiryType,
    String inquiryTitle,
    String? inquiryDescription,
    String? inquiryDetails,
    String inquiryCategory,
    double? inquiryAmount,
    String? inquiryUnit,
    String? inquiryName,
    List<File>? inquiryImages,
  ) async {
    var res = await InquiryAPIService().submitInquiry(
      inquiryType,
      inquiryTitle,
      inquiryDescription,
      inquiryDetails,
      inquiryCategory,
      inquiryAmount,
      inquiryUnit,
      inquiryName,
      inquiryImages,
    );
    return res;
  }
}
