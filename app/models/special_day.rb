class SpecialDay < ActiveRecord::Base
  def initialize(name, when_param)
    @name = name
    @when = when_param
  end
  attr_reader :name
  attr_reader :when
end
