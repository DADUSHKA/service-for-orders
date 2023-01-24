require "rails_helper"

RSpec.describe Dish, type: :model do
  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:orders) }
  end

  describe "with excluded ingredients" do
    let!(:one_dish) { create :dish, name: "One" }
    let!(:two_dish) { create :dish, name: "Two" }
    let!(:product1) { create(:ingredient, name: "Product1", available: false) }
    let!(:product2) { create(:ingredient, name: "Product2") }
    let!(:product3) { create(:ingredient, name: "Product3") }

    it "dishes are inactive for ordering" do
      one_dish.ingredients << [product1, product2]
      two_dish.ingredients << [product3, product2]

      expect(described_class.inactive_dishes_for_order).to eq [one_dish.name]
    end
  end
end
