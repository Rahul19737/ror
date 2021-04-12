class Visitor < ApplicationRecord
    belongs_to :guest

    validates :name, :phone_number, :reason_of_visit, :guest_id, presence: true, allow_nil: true
    validates :phone_number, length: { is: 10 }
    validates :reason_of_visit, length: { maximum: 100 }
    validates :reason_of_visit, length: { minimum: 5 }
    
end
