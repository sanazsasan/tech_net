require 'spec_helper'


describe "Main Controller" do

  describe "login" do

    it "should have the content 'login'" do
      visit '/main_controller/login'
      expect(page).to have_content('login')
    end
  end
  
  describe "register" do
    it "should have the content 'Registration'" do
      visit '/main_controller/register'
      expect(page).to have_content('Registration')
    end
  end

  
  describe "edit_profile" do
    it "should have the content 'Edit profile'" do
      visit '/main_controller/edit_profile'
      expect(page).to have_content('Edit profile')
    end
  end

  
  describe "pass_recov" do

    it "should have the content 'pass_recov'" do
      visit '/main_controller/pass_recov'
      expect(page).to have_content('forgot your password?')
    end
  end

  describe "main_page" do

    it "should have the content 'main_page'" do
      visit '/main_controller/main_page'
      expect(page).to have_content('Welcome')
    end
  end


  describe "prof_search" do

    it "should have the content 'prof_search'" do
      visit '/main_controller/prof_search'
      expect(page).to have_content('Professional Profile')
    end
  end



end
