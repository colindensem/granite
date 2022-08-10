defmodule Granite.Repo do
  use Ecto.Repo,
    otp_app: :granite,
    adapter: Ecto.Adapters.SQLite3

  require Ecto.Query

  @doc false
  @spec default_options(atom()) :: Keyword.t()
  def default_options(_operation) do
    [club_id: get_club_id()]
  end

  @doc false
  @spec prepare_query(atom(), Ecto.Query.t(), Keyword.t()) ::
          {Ecto.Query.t(), Keyword.t()}
  def prepare_query(_operation, query, opts) do
    cond do
      opts[:skip_club_id] || opts[:schema_migration] ->
        {query, opts}

      club_id = get_club_id() ->
        {Ecto.Query.where(query, club_id: ^club_id), opts}

      true ->
        raise "expected club_id or skip_club_id to be set"
    end
  end

  @tenant_key {__MODULE__, :club_id}

  # stores the club id in the process dictionary.
  @doc false
  @spec put_club_id(non_neg_integer) :: non_neg_integer | nil
  def put_club_id(club_id) do
    Logger.metadata(club_id: club_id)
    Process.put(@tenant_key, club_id)
  end

  @doc false
  @spec get_club_id() :: non_neg_integer() | nil
  def get_club_id() do
    # || raise("tenant not set")
    Process.get(@tenant_key)
  end
end
