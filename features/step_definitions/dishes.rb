When(/^залогинен пользователь с email "([^"]*)" и паролем "([^"]*)"$/) do |email, password|
  visit('/users/sign_in')
  within('#new_user') do
  	fill_in('user_email', with: email)
  	fill_in('user_password', with: password)
  	click_button 'Log in'
  end
  expect(page).to have_css('.row_dish')
end

When(/^создаст блюдо с данными:$/) do |table|
	visit('/admin/dishes/new')
	within(:xpath, ".//form[@id='new_dish']") do
		select(table.hashes[0][:place], from: 'Place')
		fill_in('Name', with: table.hashes[0][:name])
		fill_in('Price', with: table.hashes[0][:price])
		fill_in('Desc', with: table.hashes[0][:desc])
		click_button 'Create Dish'
	end
end

То(/^я вижу блюдо "([^"]*)" в списке блюд$/) do |name|
  expect(page).to have_content("#{name}")
end

Если(/^пройти к блюду "([^"]*)" через "([^"]*)"$/) do |id, link|
	visit('admin/dishes')
 	within("##{id}") do
 		click_link("#{link}")
 	end
end

То(/^я смогу отредактировать его новыми значениями:$/) do |table|
	within('#edit_dish') do
		fill_in('Name', with: table.hashes[0][:name])
		fill_in('Price', with: table.hashes[0][:price])
		fill_in('Desc', with: table.hashes[0][:desc])
		click_button 'Update Dish'
	end
end

То(/^я увижу блюдо "([^"]*)" в списке блюд$/) do |name|
  expect(page).to have_content("#{name}")
end

Если(/^подтверждаю удаление$/) do
  accept_alert
end


То(/^я не смогу увидеть "([^"]*)" в списке блюд$/) do |name|
	visit('admin/dishes')
  expect(page).to have_no_content("#{name}")
end

