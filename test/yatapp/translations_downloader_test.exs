defmodule Yatapp.TranslationsDownloaderTest do
  use ExUnit.Case
  import Mock

  setup_with_mocks([
    {:httpc, [],
     [
       request: fn :get, {_url, []}, [], [] ->
         {:ok, {{"HTTP/1.1", 200, 'OK'}, [], File.read!("test/fixtures/en.json")}}
       end
     ]}
  ]) do
    Application.put_env(:yatapp, :save_to_path, "test/fixtures/")
    Application.put_env(:yatapp, :translations_format, "json")
    Application.put_env(:yatapp, :locales, ["en_US"])
    Application.put_env(:yatapp, :project_id, "1")

    :ok
  end

  test "download/0" do
    assert Yatapp.TranslationsDownloader.download() == :ok
    assert File.read!("test/fixtures/en_US.json") == File.read!("test/fixtures/en.json")
  end

  test "download_and_store/0" do
    assert Yatapp.TranslationsDownloader.download_and_store() == :ok
  end
end
