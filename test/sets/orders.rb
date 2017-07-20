module Contexts
  module Orders
    # Context for orders (assumes users, schools contexts)
    def create_orders
      @alex_o1 = FactoryGirl.create(:order, user: @alex, grand_total: 94.95, date_ordered: 5.months.ago.to_date)
      @alex_o1.pay
      @alex_o2 = FactoryGirl.create(:order, user: @alex, grand_total: 79.75, date_ordered: 3.weeks.ago.to_date)
      @alex_o2.pay
      @alex_o3 = FactoryGirl.create(:order, user: @alex, grand_total: 54.50, date_ordered: Date.current)
      @walt_o1 = FactoryGirl.create(:order, user: @walt, grand_total: 43.90, date_ordered: 4.weeks.ago.to_date)
      @walt_o1.pay
      @walt_o2 = FactoryGirl.create(:order, user: @walt, grand_total: 32.50, date_ordered: Date.current)
      @sam_o1 = FactoryGirl.create(:order, user: @sam, grand_total: 388.50, date_ordered: 2.weeks.ago.to_date)
      @sam_o1.pay
    end

    def destroy_orders
      @alex_o1.delete
      @alex_o2.delete
      @alex_o3.delete
      @walt_o1.delete
      @walt_o2.delete
      @sam_o1.delete
    end

  end
end
