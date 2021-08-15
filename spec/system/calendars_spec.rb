require 'rails_helper'

RSpec.describe "Calendars", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @calendar = FactoryBot.build(:calendar)
    User.create(
      name: @user.name,
      email: @user.email,
      password: @user.password,
      password_confirmation: @user.password_confirmation,
      identity: @user.identity
    )
  end

  describe "#create" do
    context "Successfully" do
      it "you can create new schedule if you input information correctly" do
        # Visit the top page.
        visit root_path
        # Confirm that the top page has the button to render to log-in page.
        expect(page).to have_content('Log in')
        # Visit log-in page.
        visit new_user_session_path
        # Input user information.
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password 
        find('input[name="commit"]').click
        # Visit my page.
        expect(current_path).to eq(calendars_path)
        # Confirm that the my page has the button to create new scedule.
        expect(page).to have_content('Add Schedule')
        # Visit create new schedule page.
        visit new_calendar_path
        # Input the information for schedule.
        fill_in 'Title', with: @calendar.title
        fill_in 'Content', with: @calendar.content
        fill_in 'Start time', with: @calendar.start_time
        fill_in 'End time', with: @calendar.end_time
        # Confirm that pressing the create button increases the calendar model count by 1.
        expect  do
          find('input[name="commit"]').click
        end.to change { Calendar.count }.by(1)
        # Confirm that visitting the my page.
        expect(current_path).to eq(calendars_path)
        # Confirm that my calendar has new schedule which is just added.
        expect(page).to have_content("#{@calendar.title}")
        # Confirm that the my page has the log-out button.
        expect(page).to have_content('Log out')
        # Log out from Group Calendar.
        click_link 'Log out'
        # Confirm that you are in top page.
        expect(current_path).to eq(root_path)
      end
    end

    context "Unsuccessfully" do
      it "you cannot create new schedule if you input no information" do
        # Visit the top page.
        # Confirm that the top page has the button to render to log-in page.
        # Visit log-in page.
        # Input user information.
        # Visit my page.
        # Confirm that the my page has the button to create new scedule.
        # Visit create new schedule page.
        # Input no information for schedule.
        # Confirm that pressing the create button DOES NOT increases the calendar model count.
        # Confirm that you are returned to the create new schedule page.
        # Confirm that the page has error messages.
      end
    end
  end
end
