class AppwriteConstants {
  static const String databaseId = '64a918290fa122b36822';
  static const String projectId = '64a9169205230f5f53c2';
  static const String endPoint = 'https://cloud.appwrite.io/v1';

  static const String usersCollection = '64a9b0ec07148dcc351c';
  static const String tweetsCollection = '64a9b7bc6cf855763d8b';
  static const String notificationsCollection = '64a9cd4583215568f174';

  static const String imagesBucket = '64a92f5f697fcdf2cb22';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
