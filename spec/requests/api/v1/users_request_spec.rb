require "rails_helper"

describe "users request" do
  describe "POST new user" do
    it "creates a new user in the database" do
      json_payload = {
        email: "drew4@drew.com",
        password: "drew",
        password_confirmation: "drew"
      }

      post "/api/v1/users", headers: headers, params: json_payload.to_json, as: :json



      response_body = JSON.parse(response.body, symbolize_names: true)
      response = response_body[:data]

      expect(response[:type]).to eq("users")
      expect(response).to have_key(:id)
      expect(response[:id]).to be_a String
      expect(response).to have_key(:attributes)
      expect(response[:attributes]).to be_a Hash
      expect(response[:attributes][:email]).to eq(json_payload[:email])
      expect(response[:attributes]).to have_key(:api_key)
      expect(response[:attributes][:api_key]).to be_a String

    end

    it "sends back a 400 error for bad user params" do
      user = User.create!(email: "drew5@drew.com", password: "drew", password_confirmation: "drew")

      json_payload = {
        email: "drew@drew.com",
        password: "drew",
        password_confirmation: "drew"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: json_payload.to_json, as: :json

      expect(response).to have_http_status(400)
    end
  end
end
