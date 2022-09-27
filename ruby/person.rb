require_relative './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    super()
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
