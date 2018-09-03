require 'rails_helper'
describe ApiService, type: :service do
  it "returns image" do
    a = ApiService.new
    a.parse_json
  end
end