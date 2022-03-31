ActiveAdmin.register Record do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :price, :sale, :genre_id
  form do |f|
    f.semantic_errors
    f.inputs
    f.actions
    f.inputs do
      f.input :image, as: :file
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :sale, :genre_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
