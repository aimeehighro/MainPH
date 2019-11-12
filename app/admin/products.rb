ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :price, :stock_quantity, :description, :image, :category_id
  
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :image, as: :file
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  index do
      column :image do |display|
        image_tag url_for(display.image)
    end
    column :id
    column :name
    column :price
    column :stock_quantity
    column :description
    column :category_id
    column :created_at
    column :updated_at
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :stock_quantity, :description, :image, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
