require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '購入情報の保存' do
    before do
      buyer = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @item_order = FactoryBot.build(:item_order, user_id: buyer.id, item_id: item.id)
    end
          # seller = FactoryBot.create(:user)
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_order).to be_valid
    end

    it '建物名が空でも保存できる' do
      @item_order.building = nil
      expect(@item_order).to be_valid
    end
    
    it '郵便番号が空だと保存できない' do
      @item_order.post_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post code can't be blank")
    end

    it '郵便番号に【-】がないと保存できない' do
      @item_order.post_code = "1234567"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post code is invalid")
    end

    it '都道府県を選択していないと登録できない' do
      @item_order.prefecture_id = 1
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '市区町村が空だと保存できない' do
      @item_order.city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City can't be blank")
    end

    it '市区町村が半角だと保存できない' do
      @item_order.city = "ﾃｽﾄ"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City is invalid")
    end

    it '番地が空だと保存できない' do
      @item_order.house_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("House number can't be blank")
    end


    it '電話番号が空だと保存できない' do
      @item_order.phone = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone can't be blank")
    end

    it '電話番号が全角だと保存できない' do
      @item_order.phone = "０００００００００００"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone is invalid")
    end

    it '購入者idが空だと保存できない' do
      @item_order.user_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("User can't be blank")
    end

    it '商品idが空だと保存できない' do
      @item_order.item_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Item can't be blank")
    end

    it 'tokenが空だと保存できない' do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end