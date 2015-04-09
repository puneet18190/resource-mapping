class Component < ActiveRecord::Base
  belongs_to :section
  has_many :resources
  has_many :questions

  accepts_nested_attributes_for :resources,
                                :reject_if => :all_blank,
                                :allow_destroy => true
  accepts_nested_attributes_for :questions,
                                :reject_if => :all_blank,
                                :allow_destroy => true

	validates_associated :resources
end
