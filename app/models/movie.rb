class Movie < ActiveRecord::Base
	has_many :actors, through: :role
end
