Sequel.migration do
  change do
    create_table :comments do
      primary_key :id

      String :name, null: false
      column :body, :text, null: false

      foreign_key :post_id, :posts

      DateTime :created_at, index: true
    end
  end
end
