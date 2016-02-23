class Address < ActiveRecord::Base
  belongs_to :homeOwnerId

    validates :number, :street, :city, :state, :country, presence: true   
    validates :number, length:  { in: 1..6 }
    validates :street, length: { in: 1..50}
    validates :city, length: { in: 1..30}
    validates :state, length: { in: 1..2} #only accept 2 char state codes
    validates :country, length: { in: 1..20}


end
