import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:projectstructure/services/appdata.dart';

class GraphQLClientConfiguration {

  GraphQLClientConfiguration._privateConstructor();

  static final GraphQLClientConfiguration _instance = GraphQLClientConfiguration._privateConstructor();

  static GraphQLClientConfiguration get instance => _instance;

  static GraphQLClient? _graphClient;

  static GraphQLClient? get graphClient => _graphClient;

  final HttpLink _link = HttpLink(AppData.baseURL);


  Future<dynamic> query(String query) async {

    _graphClient = GraphQLClient(cache: GraphQLCache(), link: _link);

    log(" QUERY =--> $query");

    try {
      final QueryResult response = await _graphClient!
          .query(QueryOptions(
              document: gql(query), fetchPolicy: FetchPolicy.networkOnly))
          .timeout(const Duration(seconds: 60), onTimeout: () {
        throw NetworkException(
            message: 'Check your internet connection',
            uri: Uri(path: AppData.baseURL));
      });

      if (response.exception != null && response.data == null) {
        if (response.exception!.graphqlErrors.isNotEmpty) {
          log(" QUERY EXCEPTION--> ${response.exception?.graphqlErrors[0].message}");
          return <String, dynamic>{
            'status': 'error',
            'message': response.exception?.graphqlErrors[0].message ??
                'Something went wrong',
            'extensions': response.exception?.graphqlErrors[0].extensions
          };
        } else {
          log(" QUERY EXCEPTION--> ${response.exception?.linkException?.originalException}");

          return <String, dynamic>{
            'status': 'error',
            'message': response.exception?.linkException?.originalException ??
                'Something went wrong',
            'extensions': response.exception?.graphqlErrors[0].extensions
          };
        }
      }   
      log("response form server" + response.data.toString());
      return response.data;
    } catch (error) {
      log(" QUERY ERROR--> $error");

      return <String, dynamic>{
        'status': 'error',
        'message': 'Something went wrong',
        'extensions': null
      };
    }
  }
}
