require 'spec_helper'


describe "Main Controller" do

  subject { page }

  describe "login page" do
    before { visit login_path }

    it { should have_content('login') }
    it { should have_title('Login') }
    it { should_not have_title('| Home') }
  end




  describe "register" do
    it "should have the content 'Registration'" do
      visit register_path
      expect(page).to have_content('Registration')
    end
  end

  
  describe "edit_profile" do
    it "should have the content 'Edit profile'" do
      visit edit_profile_path
      expect(page).to have_content('Edit profile')
    end
  end

  
  describe "pass_recov" do

    it "should have the content 'pass_recov'" do
      visit pass_recov_path
      expect(page).to have_content('Forgot your password?')
    end
  end

  describe "main_page" do

    it "should have the content 'main_page'" do
      visit main_page_path
      expect(page).to have_content('Welcome')
    end
  end


  describe "prof_search" do

    it "should have the content 'prof_search'" do
      visit prof_search_path
      expect(page).to have_content('Professional Profile')
    end
  end



end
