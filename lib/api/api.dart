
class Api {
  static final String host = "hn.algolia.com";

  Uri endpoint({String query}) => Uri(
        host: host,
        scheme: 'https',
        path: '/api/v1/search',
        queryParameters: {
          'query': query,
        },
      );

      Uri itemEndpoint({int id})=> Uri(
        host: host,
        scheme: 'https',
        path: '/api/v1/items/$id',
        
      );

}
