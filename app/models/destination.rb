class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    validates :name, presence: true, uniqueness: true
    validates :country, presence: true, uniqueness: true

end
