require 'rails_helper'

RSpec.describe 'Calendars', type: :system do
  before do
    @user = FactoryBot.build(:user)
    @calendar = FactoryBot.build(:calendar)
  end

  describe '#create' do
    context 'Successfully' do
      it 'you can create new schedule if you input information correctly' do
        # Visit the top page.
        # Confirm that the top page has the button to render to log-in page.
        # Visit log-in page.
        # Input user information.
        # Visit my page.
        # Confirm that the my page has the button to create new scedule.
        # Visit create new schedule page.
        # Input the information for schedule.
        # Confirm that pressing the create button increases the calendar model count by 1.
        # Confirm that visitting the my page.
        # Confirm that my calendar has new schedule which is just added.
        # Confirm that the my page has the log-out button.
        # Log out from Group Calendar.
      end
    end

    context 'Unsuccessfully' do
      it 'you cannot create new schedule if you input no information' do
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
