class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.text :text
  		t.belongs_to :user
  		t.belongs_to :movie

  		t.timestamps
  	end
  end
end
