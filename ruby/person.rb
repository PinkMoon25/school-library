require_relative './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rental

  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    @rental = []
    super()
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
