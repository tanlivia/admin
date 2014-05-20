require 'spec_helper'

describe User do
  it {should respond_to(:username)}
  it {should respond_to(:locale)}
  it {should have_db_column(:username).of_type(:string)}
  it {should have_db_column(:locale).of_type(:string)}
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password)}
  it {should validate_uniqueness_of(:username)}
  it {should_not allow_mass_assignment_of(:encrypt_password)}

  it do
    should allow_value('中文').for(:username).on(:create)
  end
  it do
    should validate_confirmation_of(:password).with_message('Please re-enter your password')
  end

end

