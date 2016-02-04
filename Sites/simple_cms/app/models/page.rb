class Page < ActiveRecord::Base
	#Relationships
	belongs_to :subject
	has_many :sections
	has_and_belongs_to_many :editors, :class_name => "AdminUser"
	#Scopes
	scope :visible, lambda{where(:visible=>true)}
	scope :invisible, lambda{where(:visible=>false)}
	scope :sorted, lambda{order("pages.position ASC")}
	scope :newest_first, lambda{order("pages.created_at DESC")}
	scope :search, lambda{|query|
		where(["name LIKE ?", "%#{query}%"])
	}
end
