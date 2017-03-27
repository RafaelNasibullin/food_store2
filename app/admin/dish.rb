ActiveAdmin.register Dish do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :price, :desc, :place_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
  selectable_column
  id_column
  column :name do |dish|
    link_to dish.name, admin_dish_path(dish)
  end
  column :desc
  column :price
 	column :place_id
  actions
end

show do
  attributes_table do
    row :name
    row :desc
    row :price
    row :place_id
  end
end


end
