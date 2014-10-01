class Movie < ActiveRecord::Base
	has_many :actors, through: :role
	has_many :comments
end
