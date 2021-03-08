module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys,
      foreign_key: :toyable_id,
      class_name: :Toy
  end

  def receive_toy(name)
    #This method should first find or create a toy whose name matches the argument. 
    #Next it should add this toy to self's toys.

    @toy = Toy.find_or_create_by(name)
    self.toys += @toy
  end
end