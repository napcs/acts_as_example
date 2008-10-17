ActiveRecord::Schema.define(:version => 1) do
  create_table :widgets, :force => true do |t|
    t.column :name, :string
    t.column :created_at, :datetime
    t.column :updated_at, :datetime
  end
end