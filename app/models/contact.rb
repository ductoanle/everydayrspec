class Contact < ActiveRecord::Base
  has_many :phones
  attr_accessible :first_name, :last_name, :email
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def name
    [first_name, last_name].join(" ")
  end

  def self.by_letter(letter)
    where("first_name LIKE ?", "#{letter}%").order(:last_name)
  end
end