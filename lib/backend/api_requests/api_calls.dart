import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchCall {
  static Future<ApiCallResponse> call({
    String? searchKey = '',
    int? page,
    int? pageSize,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'search',
      apiUrl: 'https://mekaapp.com/bcd/backend/api/quran/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'search_key': searchKey,
        'page': page,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class AyatByIdCall {
  static Future<ApiCallResponse> call({
    int? suraid,
    int? ayaid,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ayat by id',
      apiUrl: 'https://mekaapp.com/bcd/backend/api/quran/aya_by_id',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'suraid': suraid,
        'ayaid': ayaid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
