class User < ApplicationRecord
    has_many :articles
    validates :name, presence: true,
                    uniqueness: {case_sensitive: false}, 
                    length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, 
                    length: { maximum: 25}, 
                    uniqueness: {case_sensitive: false},
                    format: {with: VALID_EMAIL_REGEX}
end