require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  #Shoulda tests for username
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_length_of(:username).is_at_least(2) }
  it { is_expected.to validate_length_of(:username).is_at_most(35) }
  
  #Should tests for email
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value("user@mudonymous.com").for(:email) }
  
  #Shoulda tests for password
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }
  
  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(username: user.username, email: user.email)
    end
    
    it "should only capitalizes the first letter in username" do
       user.username = "test user"
       user.save
       expect(user.username).to eq "Test user"
    end
  end
  
end
