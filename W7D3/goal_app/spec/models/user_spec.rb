require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) }

  describe "uniqueness" do
    before :each do
      create(:user)
    end
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_uniqueness_of(:username) }
  end

  describe "is_password?" do
    let!(:user) { build(:user) }

    context "with a valid password" do
      it "should return true" do
        expect(user.is_password?("123456")).to be true
      end
    end

    context "with an invalid password" do
      it "should return false" do
        expect(user.is_password?("654321")).to be false
      end
    end
  end

  

end

