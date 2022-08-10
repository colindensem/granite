defmodule GraniteWeb.Plug.Subdomain do
  @moduledoc """
    Plug to determine if subdomain present and set organisation id
  """
  import Plug.Conn
  alias Granite.Clubs
  alias Granite.Repo

  @doc false
  def init(default), do: default

  @spec call(atom | %{host: binary}, any) :: atom | %{host: binary}
  @doc false
  def call(conn, router) do
    case get_subdomain(conn.host) do
      subdomain when byte_size(subdomain) > 0 ->
        club = Clubs.get_club_by_slug!(subdomain)

        if club do
          Repo.put_club_id(club.club_id)

          conn
          |> assign(:current_club, club)
          |> router.call(router.init({}))
          |> halt
        else
          conn
        end

      _ ->
        conn
    end
  end

  defp get_subdomain(host) do
    root_host = GraniteWeb.Endpoint.config(:url)[:host]
    String.replace(host, ~r/.?#{root_host}/, "")
  end
end
