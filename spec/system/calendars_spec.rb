require 'rails_helper'

RSpec.describe 'Calendars', type: :system do
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

  describe '#create' do
    context 'Successfully' do
      it 'you can create new schedule if you input information correctly' do
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
        expect(page).to have_content(@calendar.title.to_s)
        # Confirm that the my page has the log-out button.
        expect(page).to have_content('Log out')
        # Log out from Group Calendar.
        click_link 'Log out'
        # Confirm that you are in top page.
        expect(current_path).to eq(root_path)
      end
    end

    context 'Unsuccessfully' do
      it 'you cannot create new schedule if you input no information' do
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
        # Input no information for schedule.
        fill_in 'Title', with: ''
        fill_in 'Content', with: ''
        fill_in 'Start time', with: ''
        fill_in 'End time', with: ''
        # Confirm that pressing the create button DOES NOT increases the calendar model count.
        expect  do
          find('input[name="commit"]').click
        end.to change { Calendar.count }.by(0)
        # Confirm that you are returned to the create new schedule page.
        expect(current_path).to eq('/calendars')
        # Confirm that the page has error messages.
        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Start time can't be blank")
      end
    end
  end
end
