Если(/^создаст место с данными:$/) do |table|
	visit('/admin/places/new')
	within('#new_place') do
		fill_in('Name', with: table.hashes[0][:name])
		fill_in('Desc', with: table.hashes[0][:desc])
		page.attach_file('place_image', Rails.root + 'public/test/123.png')
		click_button 'Create Place'
		sleep 2
	end
end

То(/^я вижу место "([^"]*)" в списке мест$/) do |name|
	visit('/admin/places')
	expect(page).to have_content("#{name}")
end
