class AdminUser < ActiveRecord::Base
	# To set a different table name
	# Class and file name were changed instead
	#self.table_name = "admin_users"
	
	#Relationships
	has_and_belongs_to_many :pages
end