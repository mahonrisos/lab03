class Patient < ActiveRecord::Base
	has_many :appointment

end
