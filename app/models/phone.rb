class Phone < ActiveRecord::Base
  has_and_belongs_to_many :contacts
  attr_accessible :phone_type, :phone
  validates :phone_type, :phone, presence: true
end
