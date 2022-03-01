// import 'dart:convert' as convert;
// import 'package:edusprintplus/enum/enum.dart';
// import 'package:edusprintplus/services/apiFunctions.dart';
// import 'package:edusprintplus/utilities/utility.dart';
//
// import 'constants.dart';
//
// Future insertStudentFullDetail(Map<String, dynamic> oResponse) async {
//   try {
//     var oVWStudentFullDetailNullable = oResponse["VWStudentFullDetailNullable"];
//     await Utility.writeLocalStorage(
//         localStorageKeyEnum.StudentFullDetail.toString(),
//         convert.jsonEncode(oResponse));
//
//     await Utility.writeLocalStorage(
//         localStorageKeyEnum.LstMobileAppLeftMenu.toString(),
//         convert.jsonEncode(oResponse["LstMobileAppLeftMenu"]));
//
//     await Utility.writeLocalStorage(localStorageKeyEnum.UserID.toString(),
//         oVWStudentFullDetailNullable["StudentID"].toString());
//   } catch (e) {
//     await syncError("InsertStudentFullDetail", e);
//   }
// }
//
// Future setConstantValue() async {
//   try {
//     ClientWEBURL = await Utility.readLocalStorage(
//         localStorageKeyEnum.ClientWEBURL.toString());
//     ClientShortCode = await Utility.readLocalStorage(
//         localStorageKeyEnum.ClientShortCode.toString());
//     Token =
//         await Utility.readLocalStorage(localStorageKeyEnum.Token.toString());
//     UserID =
//         await Utility.readLocalStorage(localStorageKeyEnum.UserID.toString());
//     imageFileHostedPath = ClientWEBURL + '/?imageFileHostedPath';
//   } catch (e) {
//     await syncError("setConstantValue", e);
//   }
// }
