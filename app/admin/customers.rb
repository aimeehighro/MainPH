# frozen_string_literal: true

ActiveAdmin.register Customer do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :email, :password, :street, :city, :postal_code, :province_id

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :password, as: :password
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  index do
    column :id
    column :first_name
    column :last_name
    column :email
    column :password
    column :street
    column :city
    column :postal_code
    column :province_id
    column :created_at
    column :updated_at
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :email, :password, :street, :city, :postal_code, :province_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
