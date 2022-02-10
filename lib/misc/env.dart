///Provides the backend Address as a [String]. The Adress is used to access and send data
///via HTTP-requests
const String API_ADDRESS = "https://hack-muenster.uni-muenster.de:5000";

///API Token
const String API_TOKEN = "pgAsiSKXwysRvg6ZnftqkLrVjdUlgvj7rBXPKemt8tT3RAPh6lbJM40hvAba";

///Location variable to show the user the location of the blood donation location.
const locationLat = 51.96168675419829;
const locationLng = 7.600451232961736;

///Location Service Provider Navigation Link
const locationLink =
    "https://www.google.de/maps/dir//UKM+Blutspende,+Domagkstra%C3%9Fe+11,+48149+M%C3%BCnster/@51.9609801,7.5971615,17z/data=!4m16!1m6!3m5!1s0x47b9baa498c7d0c9:0x3de4d6b0e7ea3f0d!2sUKM+Blutspende!8m2!3d51.9616783!4d7.600453!4m8!1m0!1m5!1m1!1s0x47b9baa498c7d0c9:0x3de4d6b0e7ea3f0d!2m2!1d7.600453!2d51.9616783!3e3'";

///How long should faq questions be cached.
const Duration FAQ_CACHE_DURATION = Duration(hours: 1);
