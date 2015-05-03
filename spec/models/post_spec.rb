require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:question) {FactoryGirl.create(:question)}

  it "should be a question" do
    expect(question.user_id).to eq(1)
  end

end
