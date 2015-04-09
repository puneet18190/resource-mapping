class Section < ActiveRecord::Base
  belongs_to :tool
  has_many :components
end
