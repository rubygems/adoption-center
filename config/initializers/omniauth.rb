Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'f8a31781161d9d6eafe4', '5917d6ba06f55101b6be6aba5cf4bb8fcc121036'
end
