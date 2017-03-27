ActiveAdmin.register Place do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :image, :desc
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form do |f|
    f.inputs do
      f.input :name
      f.input :desc
      f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end


index do
	selectable_column
	id_column
	column :image do |place|
		image_tag place.image.url(:thumb)
	end
	column :name do |place|
		link_to place.name, admin_place_path(place)
	end
	column :desc
	actions
end

show do
	attributes_table do
		row :image do |place|
			image_tag place.image.url(:medium)
		end
		row :name
		row :desc
	end
end


end
