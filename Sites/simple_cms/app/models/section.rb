class Section < ActiveRecord::Base
	#Relationships
	has_many :section_edits
end
