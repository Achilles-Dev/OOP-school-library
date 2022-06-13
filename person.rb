class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = "Unknown", parent_permission = true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    true if @age >= 18 || @parent_permission == true
  end

  private

  def is_of_age?
    if (@age >= 18)
      true
    else false
    end
  end
end
