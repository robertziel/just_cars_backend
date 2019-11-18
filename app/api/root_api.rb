class RootApi < Grape::API
  format :json

  helpers SerializersHelper

  mount ItemsApi
  mount WelcomeApi

  add_swagger_documentation(
    hide_documentation_path: true,
    mount_path: '/swagger_doc',
    hide_format: true
  )
end
