defmodule GraniteWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use GraniteWeb.ConnCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate
  alias GraniteWeb.Endpoint

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import GraniteWeb.ConnCase
      import Granite.Factory

      alias GraniteWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint GraniteWeb.Endpoint
    end
  end

  setup tags do
    Granite.DataCase.setup_sandbox(tags)

    conn =
      case tags[:subdomain] do
        nil ->
          Phoenix.ConnTest.build_conn(:get, "http://granite.local/", nil)

        somedomain ->
          Phoenix.ConnTest.build_conn(
            :get,
            "http://#{somedomain}.granite.local/",
            nil
          )
      end

    {:ok, conn: conn}
  end
end
