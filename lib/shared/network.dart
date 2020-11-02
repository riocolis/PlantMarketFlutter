part of 'shared.dart';

String baseUrl = 'https://whispering-dawn-05166.herokuapp.com/api/';

// class Network {
//   Client client = Client();

//   Future<dynamic> getRequest(String url, [dynamic token]) async {
//     try {
//       final response = await client.get(
//         "$url",
//         headers: {
//           'content-type': "application/json",
//           'accept': "application/json",
//           HttpHeaders.authorizationHeader: 'Bearer $token'
//         },
//       ).timeout(Duration(seconds: 20));

//       if (response.statusCode == 401) {
//         throw Exception('${response.statusCode}');
//       }
//       return response;
//     } on TimeoutException catch (_) {
//       throw Exception(_);
//     }
//   }

//   Future<dynamic> putRequest(String url, dynamic body) async {
//     // final accessToken = await Cache.getCache(key: CACHE_TOKEN_ID);
//     final response = await client.put(
//       "$url",
//       headers: {
//         'content-type': "application/json",
//         'accept': "application/json",
//         HttpHeaders.authorizationHeader: 'Bearer $accessToken'
//       },
//       body: body,
//     );

//     if (response.statusCode == 401) {
//       throw Exception('${response.statusCode}');
//     }

//     return response;
//   }

//   Future<dynamic> patchRequest(String url, dynamic body) async {
//     // final accessToken = await Cache.getCache(key: CACHE_TOKEN_ID);
//     final response = await client.patch(
//       "$url",
//       headers: {
//         'content-type': "application/json",
//         'accept': "application/json",
//         HttpHeaders.authorizationHeader: 'Bearer $accessToken'
//       },
//       body: body,
//     );

//     if (response.statusCode == 401) {
//       throw Exception('${response.statusCode}');
//     }

//     return response;
//   }

//   Future<dynamic> postRequest(String url, dynamic body) async {
//     final accessToken = await Cache.getCache(key: CACHE_TOKEN_ID);
//     final response = await client.post(
//       "$url",
//       headers: {
//         'Content-Type': "application/json",
//         'Accept': "application/json",
//         HttpHeaders.authorizationHeader: 'Bearer $accessToken'
//       },
//       body: body,
//     );

//     if (response.statusCode == 401) {
//       throw Exception('${response.statusCode}');
//     }

//     return response;
//   }

//   Future<dynamic> postRequestRefreshToken(String url) async {
//     final accessToken = await Cache.getCache(key: CACHE_TOKEN_ID);
//     final response = await client.post(
//       "$url",
//       headers: {
//         'Content-Type': "application/json",
//         'Accept': "application/json",
//         HttpHeaders.authorizationHeader: 'Bearer $accessToken'
//       },
//     );

//     if (response.statusCode == 401) {
//       throw Exception('${response.statusCode}');
//     }

//     return response;
//   }

//   Future<dynamic> delRequest(String url) async {
//     final accessToken = await Cache.getCache(key: CACHE_TOKEN_ID);
//     final response = await client.delete(
//       "$url",
//       headers: {
//         'Content-Type': "application/json",
//         'Accept': "application/json",
//         HttpHeaders.authorizationHeader: 'Bearer $accessToken'
//       },
//     );

//     if (response.statusCode == 401) {
//       throw Exception('${response.statusCode}');
//     }

//     return response;
//   }
// }
