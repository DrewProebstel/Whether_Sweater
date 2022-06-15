


require "rails_helper"

describe "sessions request" do
  describe "POST /api/v1/sessions" do
    it "creates a new session and returns user data for that session" do
      user = User.create!(email: "drew2@drew.com", password: "drew", password_confirmation: "drew")

      login = {
        email: "drew2@drew.com",
        password: "drew"
      }
      post "/api/v1/sessions", headers: headers, params: login.to_json, as: :json

      expect(response).to have_http_status(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
      user = response_body[:data]

      expect(user[:type]).to eq("users")
      expect(user[:id]).to be_a String
      expect(user[:attributes]).to be_a Hash
      expect(user[:attributes][:email]).to eq(login[:email])
      expect(user[:attributes][:api_key]).to be_a String
    end

    it "returns a 400 error if that user cannot be authenticated" do
      user = User.create!(email: "test@testing.com", password: "test123", password_confirmation: "test123")

      login = {
        email: "drew@drew.com",
        password: "werd"
      }

      post "/api/v1/sessions", headers: headers, params: login.to_json, as: :json

      expect(response).to have_http_status(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("Unacceptable Login")

    end
  end
end
