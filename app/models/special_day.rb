class SpecialDay < ActiveRecord::Base
  validates_presence_of :name, :when
  has_many :comments
end
