module Contexts
  module OrderItems

    def create_order_items
      @alex_o1_1 = FactoryGirl.create(:order_item, order: @alex_o1, item_name: "woman e14p hat", quantity: 5)
      @alex_o1_2 = FactoryGirl.create(:order_item, order: @alex_o1, item_name: "woman e14p hat", quantity: 5)
      @alex_o1_3 = FactoryGirl.create(:order_item, order: @alex_o1, item_name: "woman e14p shirt", quantity: 1)
      @alex_o2_1 = FactoryGirl.create(:order_item, order: @alex_o2, item_name: "woman e14p dress shirt", quantity: 5)
      @alex_o3_1 = FactoryGirl.create(:order_item, order: @alex_o3, item_name: "woman e14p hat", quantity: 5)
      @alex_o3_2 = FactoryGirl.create(:order_item, order: @alex_o3, item_name: "woman e14p hat", quantity: 5)
      @walter_o1_1 = FactoryGirl.create(:order_item, order: @walter_o1, item_name: "woman e14p shirt", quantity: 1)
      @walter_o2_1 = FactoryGirl.create(:order_item, order: @walter_o2, item_name: "woman e14p dress shirt", quantity: 10)
      @sam_o1_1   = FactoryGirl.create(:order_item, order: @sam_o1, item_name: "woman e14p hat", quantity: 10)
      @sam_o1_2   = FactoryGirl.create(:order_item, order: @sam_o1, item_name: "woman e14p dress shirt", quantity: 10)
      @sam_o1_3   = FactoryGirl.create(:order_item, order: @sam_o1, item_name: "woman e14p dress shirt", quantity: 10)
    end

    def destroy_order_items
      @alex_o1_1.delete
      @alex_o1_2.delete
      @alex_o1_3.delete
      @alex_o2_1.delete
      @alex_o3_1.delete
      @alex_o3_2.delete
      @walter_o1_1.delete
      @walter_o2_1.delete
      @sam_o1_1.delete
      @sam_o1_2.delete
      @sam_o1_3.delete
    end

  end
end
