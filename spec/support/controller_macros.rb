module ControllerMacros
  def login_admin
    before(:each) do
      sign_in FactoryGirl.create(:user) # Using factory girl as an example
    end
  end
end
