Rails.application.routes.draw do
  namespace :api, path: '/api' do
    mount RootApi, at: '/'
    mount GrapeSwaggerRails::Engine => '/docs'
  end
end
