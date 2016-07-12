class SpecialDay < ActiveRecord::Base
  def to_s
    return "#{self.name} - #{self.when.strftime('%d-%m-%Y')}"
  end
end
