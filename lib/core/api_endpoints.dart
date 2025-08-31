class ApiEndpoints {
  static const String ipAddress = "10.10.10.61"; // for local devs
  static const String baseUrl = "http://$ipAddress:8080/api/v1";

  // Auth
  static const String register = "$baseUrl/auth/register";
  static const String login = "$baseUrl/auth/login";

  // Audio Tracks
  static const String uploadTrack = "$baseUrl/audio/upload";
  static const String getTracks = "$baseUrl/audio/all";

  static String getTrackById(String id) => "$baseUrl/audio/$id";

  // Streaming
  static String streamTrack(String fileName) =>
      "$baseUrl/audio/stream/$fileName";

  // User
  static const String getUserProfile = "$baseUrl/user/profile";
  static const String updateUserProfile = "$baseUrl/user/update";

  // Library
  static const String getUserLibrary = "$baseUrl/library";
  static const String addToLibrary = "$baseUrl/library/add";

  static String removeFromLibrary(String trackId) =>
      "$baseUrl/library/remove/$trackId";

  // Admin / Artist Endpoints
  static const String getUploadsByArtist = "$baseUrl/audio/artist/uploads";
  static const String deleteTrack = "$baseUrl/audio/delete";

  // Utilities
  // working on it
}
