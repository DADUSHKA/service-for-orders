require "rails_helper"

RSpec.describe "Dishes Api", type: :request do
  describe "GET /api/dishes" do

    let!(:one_dish)  { create :dish, name: "Pizza" }
    let(:two_dish)   { create :dish, name: "Soup" }
    let(:three_dish) { create :dish, name: "Porridge" }
    let(:order1)     { build :order, title: "2023-01-23 18:49:08" }
    let(:order2)     { build :order, title: "2023-01-23 18:49:10" }

    let(:response_body) {
      [{ "name" => "Porridge", "count" => 2 }, { "name" => "Soup", "count" => 1 }, { "name" => "Pizza", "count" => 0 }]
    }

    before {
      order1.dishes << [three_dish, two_dish]
      order2.dishes << three_dish
      order1.save!
      order2.save!

      get "/api/dishes"
    }

    it "returns HTTP status 200" do
      expect(response).to have_http_status :ok
    end

    it "returns all dishes" do
      body = JSON.parse(response.body)

      expect(body).to eq response_body
    end
  end
end
