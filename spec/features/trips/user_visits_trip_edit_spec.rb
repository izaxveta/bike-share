require './spec/spec_helper'

feature 'When a user visits trip edit page' do
  context 'for a trip that exists' do
    background do
      Trip.create!  id: 1,
                    duration: 10,
                    start_date: '01/01/2001',
                    start_station_id: '42',
                    end_date: '02/01/2001',
                    end_station_id: '43',
                    bike_id: 1001,
                    subscription_type: 'Subscriber',
                    zip_code: 80303
      visit '/trips/1/edit'
    end

    it 'has status code 200' do
      expect(page.status_code).to eq(200)
    end

    it 'has a form' do
      expect(page).to have_css('form')
    end

    it 'they see a duration field' do
      expect(page).to have_content(/duration/i)
      expect(page).to have_field('trip[duration]')
    end

    it 'they see a start date field' do
      expect(page).to have_content(/start date/i)
      expect(page).to have_field('trip[start_date]')
    end

    it 'they see a start station field' do
      skip
      expect(page).to have_content(/start station/i)
      expect(page).to have_field('trip[start_station_id]')
    end

    it 'they see an end date field' do 
      expect(page).to have_content(/end date/i)
      expect(page).to have_field('trip[end_date]')
    end

    it 'they see an end station field' do
      skip
      expect(page).to have_content(/end station/i)
      expect(page).to have_field('trip[end_station_id]')
    end

    it 'they see a bike id field' do
      skip
      expect(page).to have_content(/bike id/i)
      expect(page).to have_field('trip[bike_id]')
    end

    it 'they see a subscription type field' do
      expect(page).to have_content(/subscription type/i)
      expect(page).to have_field('trip[subscription_type]')
    end

    it 'they see a zip code field' do
      expect(page).to have_content(/zip code/i)
      expect(page).to have_field('trip[zip_code]')
    end

    context 'when user inputs valid data' do
      background do
        fill_in 'trip[start_station_id]',   with: '42'
        fill_in 'trip[end_station_id]',     with: '43'
        fill_in 'trip[duration]',           with: 10
        fill_in 'trip[start_date]',         with: '01/01/2001'
        fill_in 'trip[end_date]',           with: '02/01/2001'
        fill_in 'trip[bike_id]',            with: 1001
        fill_in 'trip[subscription_type]',  with: 'Subscriber'
        fill_in 'trip[zip_code]',           with: 80303
        click_button 'Submit'
      end

      it 'then the user is redirected to show page with success message' do
        has_current_path?(/\/trips\/[1-9]\d*/, only_path: true)
        expect(page).to have_content(/saved/i)
      end
    end

    context 'when user inputs invalid data' do
      background do
        fill_in 'trip[start_station_id]',   with: '42'
        fill_in 'trip[end_station_id]',     with: '43'
        fill_in 'trip[duration]',           with: 'long'
        fill_in 'trip[start_date]',         with: '01/01/2001'
        fill_in 'trip[end_date]',           with: '02/01/2001'
        fill_in 'trip[bike_id]',            with: 1001
        fill_in 'trip[subscription_type]',  with: 'Subscriber'
        fill_in 'trip[zip_code]',           with: 80303
        click_button 'Submit'
      end

      it 'then the user is redirected to edit page with error flag on invalid data field' do
        has_current_path?('/trips/1/edit', only_path: true)
        expect(page).to have_content(/error/i)
      end
    end
  end

  context 'for a trip that does not exist' do
    it 'then the user is redirected to 404 error message' do
      visit '/trips/1/edit'
      expect(page).to have_content(/not found/i)
    end
  end

  context 'when user clicks on delete button' do
    background{ click_button 'delete' }

    it 'then user is redirected to index page' do
      has_current_path?('/trips', only_path: true)
      expect(page).to have_content(/delete successful/i)
    end
  end

end
