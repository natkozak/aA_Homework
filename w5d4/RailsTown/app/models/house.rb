# == Schema Information
#
# Table name: houses
#
#  id      :integer          not null, primary key
#  address :string           not null
#

class House < ApplicationRecord
  validates :id, presence: true
  validates :address, presence: true

  has_many(:people, {
    primary_key: :id, 
    foreign_key: :house_id,
    class_name: "Person"
  })
end
