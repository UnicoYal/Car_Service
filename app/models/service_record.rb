class ServiceRecord < ApplicationRecord
    belongs_to :user
    validates :date, :user_id, presence: true
end
