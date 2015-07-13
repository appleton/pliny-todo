Sequel.migration do
  change do
    create_table(:todos) do
      uuid         :id, default: Sequel.function(:uuid_generate_v4), primary_key: true
      timestamptz  :created_at, default: Sequel.function(:now), null: false
      timestamptz  :updated_at, default: Sequel.function(:now), null: false
      text         :title, null: false
      bool         :completed
      foreign_key  :user_uuid, :users, type: 'uuid'
    end
  end
end
