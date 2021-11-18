require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

if Rails.env.development?
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
  }
else
  s3_options = {
    access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
    secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
    region: "us-east-2",
    bucket: "rails-portfolio-311021",
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(**s3_options, prefix: "cache"), # temporary
    store: Shrine::Storage::S3.new(**s3_options), # permanent
  }
end

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :derivatives, create_on_promote: true # create derivatives automatically when promoting