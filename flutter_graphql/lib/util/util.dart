const String gitToken = "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";
const String retornoErro = "Usuario não encontrado.";
const String campoVazio = "Favor informar o nome do ususario";
const String defaultUrl = "https://api.github.com/graphql";
String readRepositories ({required String userName}) {
  return """
    query Flutter_Github_GraphQL{
      user(login: \"$userName\") {
        avatarUrl(size: 200)
        location
        name
        url
        email
        login
        bio
        repositories(last: 12) {
          edges {
            node {
              stargazerCount
              name
              description
            }
          }
        }
      }
    }
    """;
}