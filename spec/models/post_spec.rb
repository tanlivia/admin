require 'spec_helper'

describe Post do
  it {should respond_to(:body)}
  it {should respond_to(:title)}
  it {should validate_presence_of(:body)}
  it {should validate_presence_of(:title)}
  it {should have_db_column(:title).of_type(:string)}
  it {should have_db_column(:body).of_type(:text)}
  it {should have_many(:comments).class_name('Comment').dependent(:destroy)}
  it {should allow_mass_assignment_of(:title)}
  it {should allow_mass_assignment_of(:body)}

end

