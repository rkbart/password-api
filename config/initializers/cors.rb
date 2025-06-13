Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:5173" # origins 'https://your-frontend-domain.com'

    resource "*",
      headers: :any,
      expose: [ "access-token", "expiry", "token-type", "uid", "client" ],
      methods: [ :get, :post, :delete, :put, :patch, :options, :head ]
  end
end
