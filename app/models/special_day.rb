class SpecialDay < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :when
  def to_s
    when_str = self.when ? self.when.strftime('%d-%m-%Y') : ''
    return "#{self.name} - #{when_str}"
  end
end
