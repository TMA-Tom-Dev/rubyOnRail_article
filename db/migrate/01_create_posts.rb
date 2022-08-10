class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |p|
      p.string :body
      p.string :author

      p.timestamps
    end
  end
end
