module ControllerMacros
  def login_admin
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end
  end

  def login_no_role
    before(:each) do
      sign_in FactoryGirl.create(:user, role: nil)
    end
  end
end
