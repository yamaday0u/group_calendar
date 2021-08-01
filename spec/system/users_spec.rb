require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "#create" do
    context 'Successfully' do
      it 'you can register as a new user & visit the my page if you input correct information' do
        # Visit the top page.
        # Confirm that the top page has the button to render to sign-up page.
        # Visit sign up page.
        # Input user informations.
        # Confirm that pressing the sign-up button increases the user model count by 1.
        # Confirm that visitting the my page.
        # Confirm that the my page has the sign-out button.
      end
    end
  
    context 'Unsuccessfully' do
      it 'you cannot register as a new user & will be returned to the sign-up page uf you input incorrect information' do
        # Visit the top page.
        # Confirm that the top page has the button to render to sign-up page.
        # Visit sign up page.
        # Input user informations.
        # Confirm that pressing the sign-up button does not increases the user model count.
        # Confirm that you are returned to the sign-up page.
      end
    end

  end
end
