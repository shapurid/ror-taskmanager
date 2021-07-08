# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 50 }

  before_save { self.email = email.downcase }
  EMAIL_REGEXP = URI::MailTo::EMAIL_REGEXP
  validates :email, presence: true, format: { with: EMAIL_REGEXP }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
