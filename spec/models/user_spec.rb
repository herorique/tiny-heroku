require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: "Nhut Nguyen", username: "nhutnguyen", email:"nhut@gmail.com", phone: '0909123456', description: 'This is Nhut!')
  end

  context "validation User" do
    it "ensures the name is present" do
      user = User.new(username: "nhutnguyen", phone: '0909123456', description: 'This is Nhut!')
      expect(user.valid?).to eq(false)
    end

    it "ensures the username is present" do
      user = User.new(name: "Nhut Nguyen", phone: '0909123456', description: 'This is Nhut!')
      expect(user.valid?).to eq(false)
    end

    it "email, phone, description can be left empty" do
      user = User.new(username: "nhutnguyen", name: "Nhut Nguyen")
      expect(user.valid?).to eq(true)
    end
  end

  context "test CRUD User" do
    it 'checks that a user can be created' do
      expect(@user).to be_valid
    end

    it 'checks that a user can be read' do
      expect(User.find_by_phone("0909123456")).to eq(@user)
    end

    it 'checks that a user can be updated' do
      @user.update(:description => "This is Nhut in TINYPulse!")
      expect(User.find_by_phone("0909123456")).to eq(@user)
      expect(@user.save).to eq(true)
      expect(@user.description).to eq('This is Nhut in TINYPulse!')
    end

    it 'checks that a user can be destroyed' do
      @user.destroy
      expect(User.count).to eq(0)
    end
  end
end
