import 'package:projectstructure/services/gql_client.dart';

class ServiceConfig {
  static Future<dynamic> getCountries(code) async {
    String query = '''query{
        country(code: "$code") {
          name
          native
          capital
          emoji
          currency
          languages {
            code
            name
          }
        }
      }''';
    return GraphQLClientConfiguration.instance.query(query);
  }
}
