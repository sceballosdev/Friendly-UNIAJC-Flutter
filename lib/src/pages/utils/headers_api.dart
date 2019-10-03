class HeadersAPI {
  static Map<String, String> headers(bool isPrivate) {
    var map = Map<String, String>();
    map["Content-Type"] = "application/json";

    //map["Authorisation"] = "Token " + User.usuarioLogueado.jwt;
    if(isPrivate)
      map["Authorization"] = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJpZCI6IjEiLCJlbWFpbCI6ImVqc3A4MUBob3RtYWlsLmNvbSJ9.CItCv6kL4W9kl4D9gEcCSzly38zCGXOXBZ61nD1J_fi_2PqKfe9mCazq0Gk4BqhlPtOBZb0TZu_HiC1I4O5LGg";

    return map;
  }
}