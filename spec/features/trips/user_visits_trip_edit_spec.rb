require './spec/spec_helper'

feature 'When a user visits trip edit page' do

  context('for a trip that doesn\'t exist') do
    background { visit 'trips/0/edit' }
    it 'they see the not found page' do
      expect(page).to have_content(/not found/i)
    end
  end

  context 'for a trip that exists' do
    background { visit '/trips/6342/edit' }

    it 'has a form' do
      expect(page).to have_css('form')
    end

    it 'they see a start station drop-down' do
      expect(page).to have_content(/start station/i)
      expect(page).to have_select 'trip[start_station_id]'#, with_selected: 57
    end

    it 'they see an end station drop-down' do
      expect(page).to have_content(/end station/i)
      expect(page).to have_select 'trip[end_station_id]'#, with_selected: 50
    end

    it 'they see a start date field' do
      expect(page).to have_content(/start date/i)
      expect(page).to have_field 'trip[start_date]', with: '2013-08-30'
    end

    it 'they see an end date field' do
      expect(page).to have_content(/end date/i)
      expect(page).to have_field 'trip[end_date]', with: '2013-08-30'
    end

    it 'they see a duration field' do
      expect(page).to have_content(/duration/i)
      expect(page).to have_field 'trip[duration]', with: '556'
    end

    it 'they see a bike field' do
      expect(page).to have_field 'trip[bike_id]', with: '342'
    end

    it 'they see a subscription type field' do
      expect(page).to have_content(/subscription type/i)
      expect(page).to have_field 'trip[subscription_type]', with: 'Subscriber'
    end

    it 'they see a zip code field' do
      expect(page).to have_content(/zip code/i)
      expect(page).to have_field 'trip[zip_code]', with: '94123'
    end

    context 'when user inputs valid data' do
      background do
        fill_in 'trip[duration]', with: 83
        click_button 'submit'
      end

      it 'then the user is redirected to show page' do
        has_current_path?(/\/trips\/[1-9]\d*/, only_path: true)
      end
    end

    context 'when user inputs invalid data' do
      background do
        fill_in 'trip[duration]', with: 'long'
        click_button 'submit'
      end

      it 'then the user is redirected to edit page with error flag on invalid data field' do
        has_current_path?('/trips/1/edit', only_path: true)
      end
    end

  end

  context 'when user clicks on delete button' do
    background{ click_button 'delete' }
    it 'then user is redirected to index page' do
      expect(page).to have_current_path?('/trips', only_path: true)
    end
  end

end
