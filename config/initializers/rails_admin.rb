# RailsAdmin config file. Generated on July 17, 2013 19:45
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  config.main_app_name = ['BMW Catalog', 'Admin']
  config.current_user_method { current_user } # auto-generated
  config.included_models = ['Offer', 'Brand', 'Serie', 'Line', 'Car', 'SpecificationType', 'CarFile']

  config.actions do
    dashboard do
      statistics true
    end
    index
    new
    show
    edit
    delete
    bulk_delete
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
      field :validUntil do 
        date_format :default
      end
      field :url

      field :image do
        help 'Imagen requerida y sin bordes - Tamaño: 237x227, Formato: JPG'
      end

      field :largeImage do
        help 'Imagen requerida y sin bordes - Tamaño: 758x320, Formato: JPG'

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
      field :lines
    end
  end

  config.model 'Line' do
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
      field :line
      field :image, :carrierwave do
        filterable false
      end
      field :enabled
    end

    edit do
      field :modelName
      field :year
      field :highlights
      field :line
      field :image do
        help 'Imagen requerida y sin bordes - Tamaño: 728x364, Formato: JPG'
      end
      field :enabled
    end

    show do
      field :modelName
      field :year
      field :highlights
      field :line
      field :image
      field :enabled
      field :car_file

      field :specifications do |record|
        pretty_value do
          bindings[:view].render :partial => 'rails_admin/main/specifications', :locals => { :field => self }
        end
        #def render
        #  bindings[:view].render :partial => 'rails_admin/main/specifications'
        #end
      end
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
      field :created_at
    end

    edit do
      field :xls, :carrierwave do
        help "Plantilla en excel con formato xlsx"
      end

      field :image, :carrierwave do
        help 'Imagen requerida y sin bordes - Tamaño: 728x364, Formato: JPG'
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
      field :created_at
    end
  end

end
