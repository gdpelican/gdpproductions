Paperclip::Attachment.default_options.merge!(
  storage: :s3,
  s3_host_name: 's3-us-west-2.amazonaws.com',
  path: "/:style/:id/:filename",
  s3_credentials: {
    bucket: ENV['S3_BUCKET'],
    access_key_id: ENV['S3_KEY'],
    secret_access_key: ENV['S3_SECRET']
  }
)