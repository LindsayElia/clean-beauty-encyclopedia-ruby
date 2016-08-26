Rails.application.routes.draw do
    
    root 'statics#index'

    get 'products/index'

    get 'products/show'

    get 'brands/index'

    get 'brands/show'

    get 'statics/index'

end

#         Prefix Verb URI Pattern               Controller#Action
#           root GET  /                         statics#index
# products_index GET  /products/index(.:format) products#index
#  products_show GET  /products/show(.:format)  products#show
#   brands_index GET  /brands/index(.:format)   brands#index
#    brands_show GET  /brands/show(.:format)    brands#show
#  statics_index GET  /statics/index(.:format)  statics#index