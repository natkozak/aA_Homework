# == Schema Information
#
# Table name: people
#
#  id       :integer          not null, primary key
#  name     :string           not null
#  house_id :integer
#

class Person < ApplicationRecord
  validates :id, presence: true
  validates :name, presence: true

  belongs_to(:house, {
    primary_key: :id, 
    foreign_key: :house_id,
    class_name: "House"
  })
end
