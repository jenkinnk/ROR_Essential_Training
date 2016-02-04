class Section < ActiveRecord::Base
	#Relationships
	has_many :section_edits
	has_many :editors, :through => :section_edits, :class_name => "AdminUser"
end
