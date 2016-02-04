class AdminUser < ActiveRecord::Base
	# To set a different table name
	# Class and file name were changed instead
	#self.table_name = "admin_users"
	
	#Relationships
	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits
end
