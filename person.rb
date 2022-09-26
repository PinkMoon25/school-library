class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end

person = Person.new(25)
p person
p person.can_use_services?

person2 = Person.new(16, 'Tushar', false)
p person2
p person2.can_use_services?
