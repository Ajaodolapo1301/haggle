import 'package:flutter/material.dart';
import 'package:graphql/client.dart';


class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    uri:  'https://hagglex-backend-staging.herokuapp.com/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}

