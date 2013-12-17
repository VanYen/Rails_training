require 'spec_helper'

describe Micropost do
 
  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @micropost = Micropost.new(content: "Lorem ipsum", user_id: user.id)
  end

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it {should respond_to(:user)}
  its(:user) {should eq user}

  it { should be_valid }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @micropost.content = "" }
    it { should_not be_valid }
  end
  

  describe "when content is not longer 140 char" do
    before { @micropost.content = "a"*141 }
    it { should_not be_valid }
  end
  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do
      before { visit root_path }
      it "should delete a micropost" do
        expect { click_link "delete" }.to change(Micropost, :count).by(-1)
      end
    end
  end
end
