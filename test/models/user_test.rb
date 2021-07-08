# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create new user' do
    user = User.new(name: 'Piter', email: 'piter@a.it', password: '1234567', password_confirmation: '1234567')
    assert user.valid?
    assert user.save
  end

  test 'email uniqness case insensitive' do
    name, email = users(:one).values_at(:name, :email)
    user = User.new(name: name, email: email.upcase, password: '123456', password_confirmation: '1234567')
    assert_not user.valid?
    assert_not user.save
  end
end
