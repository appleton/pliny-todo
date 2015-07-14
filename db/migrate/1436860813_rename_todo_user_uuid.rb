Sequel.migration do
  change do
    rename_column :todos, :user_uuid, :user_id
  end
end
