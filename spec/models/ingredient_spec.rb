require "rails_helper"

RSpec.describe Ingredient, type: :model do
  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:dishes) }
  end
end
