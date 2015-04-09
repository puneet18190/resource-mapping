class Tool < ActiveRecord::Base
	has_many :sections
	has_many :content_blocks
end
