require 'rails_helper'
before do
  @user = FactoryBot.build(:user)
end
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do

    end
    it "emailが空だと登録できない" do
      
    end
    it "passwordが空だと登録できない" do
      
    end
    it ""
  end
end
