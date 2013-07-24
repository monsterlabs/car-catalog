# RailsAdmin config file. Generated on July 17, 2013 19:45
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Car Catalog', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Offer', 'User']

  # Include specific models (exclude the others):
  config.included_models = ['Offer', 'Brand', 'Serie', 'CarLine', 'Car', 'SpecificationType', 'CarFile']

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:
  config.actions do
    dashboard
    index
    new
    show
    edit
    delete
  end

  config.label_methods << :to_s

  config.model 'Offer' do
    list do
      sort_by :title
      field :title
      field :image, :carrierwave do
        filterable false
      end
      field :validUntil do
        filterable false
      end
      field :enabled

    end

    edit do
      field :title
      field :body
      field :validUntil
      field :url

      field :image do
        help 'Requerido y sin bordes - Tamaño: 237x227, Formato: jpg, jpeg, gif o png'
      end

      field :largeImage do
        help 'Requerido y sin bordes - Tamaño: 758x320, Formato: jpg, jpeg, gif o png'

      end

      field :enabled
    end

    show do
      field :title
      field :body
      field :validUntil
      field :url
      field :image
      field :largeImage
      field :enabled
    end
  end

  config.model 'Brand' do
    list do 
      field :name
    end
  end

  config.model 'Serie' do
    list do
      field :name
      field :brand
      field :enabled
    end

    edit do
      field :name
      field :brand
      field :enabled
      field :car_lines
    end
  end

  config.model 'CarLine' do
    list do
      field :name
      field :serie
      field :enabled
    end

    edit do
      field :name
      field :serie
      field :enabled
    end
  end

  config.model 'Car' do
    list do
      field :modelName do
        queryable false
        filterable false
      end
      field :year
      field :car_line
      field :image, :carrierwave do
        filterable false
        help 'Requerido y sin bordes - Tamaño: 728x364, Formato: jpg, jpeg, gif o png'
      end
      field :enabled
    end

    edit do
      field :modelName
      field :year
      field :highlights
      field :car_line
      field :image
      field :enabled
    end

    show do
      field :modelName
      field :year
      field :highlights
      field :car_line
      field :image
      field :enabled
      field :car_file
    end

  end

  config.model 'SpecificationType' do
    list do 
      field :name
    end
  end

  config.model 'CarFile' do
    list do
      field :model
      field :line
      field :year
      field :serie
      field :imported
    end

    edit do
      field :xls, :carrierwave
      field :image, :carrierwave do
        help 'Requerido y sin bordes - Tamaño: 728x364, Formato: jpg, jpeg, gif o png'
      end
    end

    show do
      field :model
      field :line
      field :year
      field :serie
      field :imported
      field :xls, :carrierwave
      field :image, :carrierwave
      field :xls_errors
      field :car
    end
  end

  # config.model 'Offer' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your offer.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :body, :string 
  #     configure :enabled, :boolean 
  #     configure :image, :carrierwave 
  #     configure :largeImage, :carrierwave 
  #     configure :title, :string 
  #     configure :url, :string 
  #     configure :validUntil, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  User  ###

  # config.model 'User' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your user.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :failed_attempts, :integer 
  #     configure :unlock_token, :string 
  #     configure :locked_at, :datetime 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :is_admin, :boolean 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
