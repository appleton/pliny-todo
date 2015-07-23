Sequel.migration do
  change do
    add_column :todos, :due_at, DateTime
  end

end
