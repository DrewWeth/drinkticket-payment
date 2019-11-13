class Item < ApplicationRecord
    belongs_to :group
    has_and_belongs_to_many :receipts
end
