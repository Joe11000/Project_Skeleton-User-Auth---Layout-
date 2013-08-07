require 'bcrypt'

class Post < ActiveRecord::Base
  belongs_to :category

  validates     :text, presence: true
       
  validates     :text,   length: {minimum: 2}

  # before_create :giveEncryptedUrl

  # def giveEncryptedUrl()
  #   self.encrypted_url = BCrypt::
  # end
end
