require './spec/spec_helper'

feature 'When a user visits the Weather Dashboard' do

    background { visit '/weather-dashboard' }

    it 'they see a link to see all conditions in index' do
        expect(page).to have_content(/see all/i)
    end
    
    it 'they see trip breakout for temperatures in 10 degree chunks' do
        expect(page).to have_content(/per 10 degree/i)
    end
    
    it 'they see trip breakout for days with precipitation in half-inch increments' do
        expect(page).to have_content(/2 in of precipitation/i)
    end
    
    it 'they see trip breakout for days with mean visibility in four mile increments' do
        expect(page).to have_content(/per 4 mile increment/i)
    end
    it 'they see trip breakout for days with mean wind speeds in four mile increments' do
        expect(page).to have_content(/per 4 miles/i)
    end
end