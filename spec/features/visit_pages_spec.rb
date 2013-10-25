require 'spec_helper'


describe "VisitPages" do

  describe "VisitPagesFromGuest" do
    it "visit main page from guest" do
      #user = FactoryGirl.create(:user)
       visit main_index_path
      current_path.should eq(main_index_path)
    end
    it "visit account page from guest" do
      visit accounts_path
      current_path.should eq(root_path)
    end
    it "visit type_account page from guest" do
      visit type_accounts_path
      current_path.should eq(root_path)
    end
    it "visit shop page from guest" do
      visit shops_path
      current_path.should eq(root_path)
    end
    it "visit login page from guest" do
      visit log_in_path
      current_path.should eq(log_in_path)
    end
    it "visit sign_up page from guest" do
      visit sign_up_path
      current_path.should eq(sign_up_path)
    end
    it "visit happy page from guest" do
      visit happy_path
      current_path.should eq("/QTByrKR")
    end
  end


end
