defmodule Granite.Clubs.Club do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:club_id, :id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_fields ~w(contact_email contact_name name slug)a
  @optional_fields ~w(is_active)a

  schema "clubs" do
    field :contact_email, :string
    field :contact_name, :string
    field :is_active, :boolean, default: false
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(club, attrs) do
    club
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_format(:contact_email, ~r/@/)
    |> validate_length(:name, min: 3, max: 120)
    |> validate_length(:contact_name, min: 3, max: 120)
    |> validate_length(:slug, min: 3, max: 30)
    |> slugify_slug()
  end

  defp slugify_slug(%{changes: %{slug: slug} = changes} = changeset)
       when map_size(changes) > 0
       when not is_nil(slug)
       when slug != "" do
    new_slug =
      slug
      |> String.downcase()
      |> String.replace(~r/[^a-z0-9\s-]/, "-")
      |> String.replace(~r/(\s|-|_)+/, "-")

    put_change(changeset, :slug, new_slug)
  end

  defp slugify_slug(changeset), do: changeset
end
