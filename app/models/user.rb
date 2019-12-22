class User < ApplicationRecord
    validates :email, uniqueness: true
    has_many :article
end
