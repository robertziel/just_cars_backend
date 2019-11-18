class RootApi < Grape::API
  format :json

  mount WelcomeApi
end
