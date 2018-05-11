json.extract! prom_env, :id, :environment, :description, :created_at, :updated_at
json.url prom_env_url(prom_env, format: :json)
