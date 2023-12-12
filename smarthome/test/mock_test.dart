import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:smarthome/mock.dart';

import 'mock_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ApiProvider apiProvider;
  late http.Client client;

  setUp((){
    client = MockClient();
    apiProvider = ApiProvider(client: client);
  });

  test('returns an Album if the http call completes successfully', () async {
    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
        .thenAnswer((_) async =>
          http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));
    
    final album = await apiProvider.fetchAlbum();
    expect(album, isA<Album>());
    expect(album.id, 2);
    expect(album.title, 'mock');
  });

  test('throws an exception if http call completes with an error', () async {
    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
        .thenAnswer((_) async =>
          http.Response('Not Found', 400));
    
    expect(apiProvider.fetchAlbum(), throwsException);
  });
}