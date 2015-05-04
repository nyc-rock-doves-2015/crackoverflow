require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:user) {FactoryGirl.create(:user)}
  let(:question) {FactoryGirl.create(:question, user_id: user.id)}


  it "should have the last question be on top" do
    last_question = FactoryGirl.create(:question)
    expect(Post.filter("newest").first).to eq(last_question)
  end

  it "should have the last question be on bottom" do
    last_question = FactoryGirl.create(:question)
    expect(Post.filter("oldest").last).to eq(last_question)
  end

  it "should increase reputation by 1" do
    question.update_reputation("up")
    expect(question.reputation).to eq(1)
  end

  it "should decrease reputation by 1" do
    question.update_reputation("down")
    expect(question.reputation).to eq(-1)
  end

end
