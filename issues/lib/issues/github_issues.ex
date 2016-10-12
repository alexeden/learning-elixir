defmodule Issues.GithubIssues do
  @github_url Application.get_env(:issues, :github_url)
  @user_agent [ {"User-Agent", "Elixir github.com/alexeden"} ]

  def fetch(user, project) do
    issues_url(user, project)
    |>  HTTPoison.get(@user_agent)
    |>  handle_response
  end

  def issues_url(user, project), do: "#{@github_url}/repos/#{user}/#{project}/issues"

  def handle_response({ :ok, %{status_code: 200, body: body} }) do
    { :ok, Poison.Parser.parse! body }
  end

  def handle_response({ _, %{status_code: __, body: body} }) do
    { :error, Poison.Parser.parse! body }
  end

end
