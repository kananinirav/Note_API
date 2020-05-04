class Product < ActiveRecord::Base
    validates :name, presence: true
    validates :price, presence: true
    validates :short_description, presence: true
    validates :full_description, presence: true
end
