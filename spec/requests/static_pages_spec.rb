require 'spec_helper'
 #before {visit root_path}
describe "StaticPages" do
  subject { page }
  # visit root_path
    # it "should click in link" do
      # click_link "About"
      # it{should have_title(full_title('About Us'))}
    # end
  describe "Home page" do
     before { visit root_path} #visit root_path
    # it "should have content 'Home'" do
     # expect(page).to have_title("| Home")
    # end
    it { should have_title('| Home')}
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
    
  end
  describe "Help page" do
    before { visit help_path }
    # it "should have content 'Help'" do
      # #visit help_path
     # expect(page).not_to have_title("| Help")
    # end
    it {should_not have_title('| Help')}
  end
  describe "About page" do
      before { visit about_path }
    # it "should have the content 'About Us'" do
      # #visit about_path
      # expect(page).not_to have_title("| About Us")
    # end
    it {should_not have_title('| About Us')}
    
  end
end
