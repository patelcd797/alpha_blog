class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {minimum: 2, maximum: 10}
    validates :description, presence: true, length: {minimum: 10, maximum: 100}
    has_many :article_categories
    has_many :categories, through: :article_categories
end