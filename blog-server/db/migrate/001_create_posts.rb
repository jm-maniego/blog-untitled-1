Sequel.migration do
  change do
    create_table :posts do
      primary_key :id

      String :title, null: false
      column :body, :text, null: false

      DateTime :created_at, index: true
      DateTime :updated_at, index: true
    end
  end
end
