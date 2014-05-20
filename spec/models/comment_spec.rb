require 'spec_helper'

describe Comment do
  it {should respond_to(:body)}
  it {should validate_presence_of(:body)}
  it {should have_db_column(:body).of_type(:text)}
  it {should allow_mass_assignment_of(:body)}
  it {should belong_to(:post).class_name('Post')}

end
