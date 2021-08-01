require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "#create" do
    context 'Successfully' do
      it 'you can register as a new user & visit the my page if you input correct information' do
        # Visit the top page.
        visit root_path
        # Confirm that the top page has the button to render to sign-up page.
        expect(page).to have_content('Sign up')
        # Visit sign up page.
        visit new_user_registration_path
        # Input user informations.
        fill_in 'Name', with: @user.name
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        fill_in 'Password confirmation', with: @user.password_confirmation
        fill_in 'Identity', with: @user.identity
        # Confirm that pressing the sign-up button increases the user model count by 1.
        expect{
          find('input[name="commit"]').click
        }.to change { User.count }.by(1)
        # Confirm that visitting the my page.
        expect(current_path).to eq(calendars_path)
        # Confirm that the my page has the sign-out button.
      end
    end
  
    context 'Unsuccessfully' do
      it 'you cannot register as a new user & will be returned to the sign-up page uf you input incorrect information' do
        # Visit the top page.
        # visit root_path
        # Confirm that the top page has the button to render to sign-up page.
        # expect(page).to have_content('Sign up')
        # Visit sign up page.
        # vist new_user_registration_path
        # Input user informations.
        # Confirm that pressing the sign-up button does not increases the user model count.
        # Confirm that you are returned to the sign-up page.
      end
    end

  end
end
