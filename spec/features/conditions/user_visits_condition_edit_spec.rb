require './spec/spec_helper'

feature 'When a user visits condition edit page' do

  context 'for a condition that does not exist' do
    it 'then they see a 404 error message' do
      visit "/conditions/0"
      expect(page).to have_content(/not found/i)
    end
  end

  context 'for a condition that exists' do
    background { visit '/conditions/1/edit' }

    it 'they see a form' do
      expect(page).to have_css('form')
    end

    it 'they see a date field' do
      expect(page).to have_content "Date"
      expect(page).to have_field 'condition[date]', with: '2013-08-29'
    end

    it 'they see a maximum temperature field' do
      expect(page).to have_content "Max Temperature (farenheit)"
      expect(page).to have_field 'condition[max_temperature_f]', with: '74.0'
    end

    it 'they see a mininum temperature field' do
      expect(page).to have_content 'Min Temperature (farenheit)'
      expect(page).to have_field 'condition[min_temperature_f]', with: '68.0'
    end

    it 'they see a mean temperature field' do
      expect(page).to have_content 'Average Temperature (farenheit)'
      expect(page).to have_field 'condition[mean_temperature_f]', with: '61.0'
    end

    it 'they see a mean humidity field' do
      expect(page).to have_content 'Average Humidity'
      expect(page).to have_field 'condition[mean_humidity]', with: '75.0'
    end

    it 'they see a mean visibility miles field' do
      expect(page).to have_content 'Average Visibility (miles)'
      expect(page).to have_field 'condition[mean_visibility_miles]', with: '10.0'
    end

    it 'they see a mean wind speed field' do
      expect(page).to have_content 'Average Wind Speed (mph)'
      expect(page).to have_field 'condition[mean_wind_speed_mph]', with: '11.0'
    end

    it 'they see a precipitation field' do
      expect(page).to have_content 'Precipitation (inches)'
      expect(page).to have_field 'condition[precipitation_inches]', with: '0.0'
    end

    context 'when user inputs valid data' do
      background do
        fill_in "condition[date]",                  with: "4/20/2013"
        fill_in "condition[max_temperature_f]",     with: "74.0"
        fill_in "condition[mean_temperature_f]",    with: "68.0"
        fill_in "condition[min_temperature_f]",     with: "61.0"
        fill_in "condition[mean_humidity]",         with: "75.0"
        fill_in "condition[mean_visibility_miles]", with: "10.0"
        fill_in "condition[mean_wind_speed_mph]",       with: "11.0"
        fill_in "condition[precipitation_inches]",  with: "10"
        click_button "submit"
      end

      it 'then the user is redirected to show page with success message' do
        has_current_path?("/conditions/1", only_path: true)
      end
    end

    context 'when user inputs invalid data' do
      background do
        fill_in "condition[date]",                  with: "hot!"
        fill_in "condition[max_temperature_f]",     with: "hot!"
        fill_in "condition[mean_temperature_f]",    with: "hot!"
        fill_in "condition[min_temperature_f]",     with: "61.0"
        fill_in "condition[mean_humidity]",         with: "75.0"
        fill_in "condition[mean_visibility_miles]", with: "10.0"
        fill_in "condition[mean_wind_speed_mph]",      with: "11.0"
        fill_in "condition[precipitation_inches]",  with: "0"
        click_button "submit"
      end

      it 'then user stays on page and sees error flag on invalid data field' do
        skip
        has_current_path?("/conditions/1", only_path: true)
        expect(page).to have_content(/error/i)
      end
    end

  end

  context 'for a condition that does not exist' do
    it 'then the user sees a 404 error message' do
      visit "/conditions/0"
      expect(page).to have_content(/not found/i)
    end
  end

  context 'when user clicks on delete button' do
    background { click_button 'delete' }
    it 'they are redirected to index page' do
      has_current_path?("/conditions", only_path: true)
    end
  end

end
