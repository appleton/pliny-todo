Sequel.migration do
  change do
    alter_table(:todos) do
      set_column_default :completed, false
      set_column_not_null :completed
    end
  end
end
