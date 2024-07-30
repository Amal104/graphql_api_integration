import 'package:flutter/material.dart';
import 'package:graphql_api/Model.dart';
import 'package:graphql_flutter/graphql_flutter.dart'; // Import the character model

class Homepage extends StatelessWidget {
  final String data = """
query {
  characters(){
    results{
      name
      image
      species
    }
  }
}
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rick and Morty Characters"),
        ),
        body: Query(
          options: QueryOptions(document: gql(data)),
          builder: (result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text("error");
            }
            if (result.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<Result> data = (result.data?["characters"]["results"] as List)
                .map((character) => Result.fromJson(character))
                .toList();
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListTile(
                    leading: Image.network(data[index].image),
                    title: Text(data[index].name),
                    subtitle: Text(data[index].species),
                  ),
                );
              },
            );
          },
        ));
  }
}
