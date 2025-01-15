```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Handle the successful response here
      // ...
    } else {
      //Instead of throwing a generic exception, throw a custom exception with more context.
      throw HttpException('Failed to load data: ${response.statusCode}', uri: Uri.parse('https://api.example.com/data')); 
    }
  } on HttpException catch (e) {
    //Handle HttpException specifically
    print('HTTP Error: ${e.message} at ${e.uri}');
  } catch (e) {
    // Handle other exceptions
    print('An unexpected error occurred: $e');
    //In a real app, consider logging this error to a service like Sentry or Firebase Crashlytics 
  }
}
```