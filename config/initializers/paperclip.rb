Paperclip::Attachment.default_options.merge!(
  storage: :s3,
  path: "/:style/:id/:filename",
  s3_credentials: {
    bucket: ENV['S3_BUCKET'],
    access_key_id: ENV['S3_KEY'],
    secret_access_key: ENV['S3_SECRET']
  }
)
