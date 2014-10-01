class Actor < ActiveRecord::Base
	has_many :movies, through: :role
end
