require 'spec_helper'


describe "get venues" do
  let(:base_request) { get '/venues.json', base_params.merge(attached_params) }
  let(:base_params)  { {} }
  let(:attached_params)  { {} }
  let(:signuped_user) { FactoryGirl.create(:user) }
  before {
    get "/users/sign_in"
    post "/users/sign_in", username: signuped_user.email, password: "password"
  }

  subject { base_request }
  it { should be 200 }
end
