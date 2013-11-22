class Phone < ActiveRecord::Base
  belongs_to :contact
  attr_accessible :phone_type, :phone
  validates :phone_type, :phone, presence: true
end
