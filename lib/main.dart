import 'package:flutter/material.dart';
import 'package:graphql_api/HomePage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpLink link = HttpLink("https://rickandmortyapi.com/graphql");
  await initHiveForFlutter();
  ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore())));
  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.client,
  });

  final ValueNotifier<GraphQLClient> client;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          home: Homepage(),
        ),
      ),
    );
  }
}
