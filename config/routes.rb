Rails.application.routes.draw do
  namespace :api, path: '/api' do
    mount RootApi, at: '/'
  end
end
