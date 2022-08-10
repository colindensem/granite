defmodule Granite.Repo.Migrations.CreateClubs do
  use Ecto.Migration

  def change do
    create table(:clubs, primary_key: false) do
      add :club_id, :bigserial, primary_key: true
      add :name, :string, null: false
      add :contact_email, :string, null: false
      add :contact_name, :string, null: false
      add :slug, :string, null: false
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:clubs, [:slug])
  end
end
