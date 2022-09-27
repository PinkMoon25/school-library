require_relative './nameable'
require_relative './person'

class BaseDecorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.slice(0, 10)
  end
end

# person = Person.new(22, 'maximilianus')
# p person
# p person.correct_name
# p capitalizedPerson = CapitalizeDecorator.new(person)
# p capitalizedPerson.correct_name
# p capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
# p capitalizedTrimmedPerson.correct_name
