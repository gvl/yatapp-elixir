use Mix.Config

config :yatapp,
  api_key: System.get_env("YATA_API_KEY"),
  project_id: System.get_env("YATA_PROJECT_ID"),
  default_locale: "en",
  locales: ~w(en),
  otp_app: :yatapp,
  json_parser: Jason,
  store: Yatapp.Store.ETS,
  download_on_start: false,
  save_to_path: "priv/locales/",
  translations_format: "json",
  translation_file_parser: Jason,
  root: false,
  strip_empty: false,
  enable_websocket: false,
  var_prefix: "%{",
  var_suffix: "}",
  fallback: false
