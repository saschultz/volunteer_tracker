require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the project to volunteer path', {:type => :feature} do
  it 'processes the user entry and returns the project with its volunteers' do
    visit '/'
    fill_in 'name', :with => 'Save the Great Barrier Reef'
    click_button 'Create'
    click_link 'Save the Great Barrier Reef'
    fill_in 'volunteer_name', :with => 'Wes Anderson'
    click_button 'Add'
    expect(page).to have_content 'Wes Anderson'
  end
end

describe 'the update project path', {:type => :feature} do
  it 'processes the user entry and returns the updated project name' do
    visit '/'
    fill_in 'name', :with => 'save the great barrier reef'
    click_button 'Create'
    click_link 'save the great barrier reef'
    fill_in 'name', :with => 'Save the Great Barrier Reef'
    click_button 'Update'
    expect(page).to have_content 'Save the Great Barrier Reef'
  end
end

describe 'the delete project path', {:type => :feature} do
  it 'processes the user entry and deletes the project' do
    visit '/'
    fill_in 'name', :with => 'Save the Great Barrier Reef'
    click_button 'Create'
    click_link 'Save the Great Barrier Reef'
    click_button 'Delete Project'
    page.has_xpath? '/'
  end
end

describe 'the update volunteer path', {:type => :feature} do
  it 'processes the user entry and updates the volunteer name' do
    visit '/'
    fill_in 'name', :with => 'Save the Great Barrier Reef'
    click_button 'Create'
    click_link 'Save the Great Barrier Reef'
    fill_in 'volunteer_name', :with => 'Tim Burton'
    click_button 'Add'
    click_link 'Tim Burton'
    fill_in 'volunteer_name', :with => 'Timothy Burton'
    click_button 'Update'
    expect(page).to have_content 'Timothy Burton'
  end
end

describe 'the delete volunteer path', {:type => :feature} do
  it 'processes the user entry and deletes the volunteer' do
    visit '/'
    fill_in 'name', :with => 'Save the Great Barrier Reef'
    click_button 'Create'
    click_link 'Save the Great Barrier Reef'
    fill_in 'volunteer_name', :with => 'Tim Burton'
    click_button 'Add'
    click_link 'Tim Burton'
    click_button 'Delete Volunteer'
    page.has_xpath? '/'
  end
end
