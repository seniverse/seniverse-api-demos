defmodule SeniverseDemo do
  @moduledoc """
  Demo for instruction about how to call Seniverse APIs via Elixir
  """
  import DateTime

  @exmaple_url "https://api.seniverse.com/v3/weather/now.json"
  # Replace key and uid by your own pair,
  # DO keep them secret in production
  @uid "your_public_key"
  @key "your_private_key"

  defmodule Token do
    @moduledoc """
    Functions to create token needed by HTTP calls
    """

    @doc """
    Create sig param for Seniverse API

    ## Examples:

      iex> SeniverseDemo.Token.create_sig("your_private_key", "your_public_key", 1558616981, 300)
      "zMrLhp9rC7CQEvnl8D2XptKu/6o="

      iex> SeniverseDemo.Token.create_sig("a", "b", 1558617057, 1800)
      "KKVBU8C80mLU7IIMwwKomppC3vE="
    """
    @spec create_sig(
            binary(),
            binary(),
            integer(),
            integer()
          ) :: binary()
    def create_sig(key, uid, ts, ttl) do
      :crypto.hmac(:sha, key, "ts=#{ts}&ttl=#{ttl}&uid=#{uid}") |> Base.encode64()
    end
  end

  @doc """
  Call v3_weather_now of Seniverse API
  """
  @spec call() :: %{
          :__struct__ => HTTPotion.AsyncResponse | HTTPotion.ErrorResponse | HTTPotion.Response,
          optional(:body) => any(),
          optional(:headers) => HTTPotion.Headers.t(),
          optional(:id) => any(),
          optional(:message) => any(),
          optional(:status_code) => integer()
        }
  def call do
    ts = utc_now() |> to_unix()
    ttl = 300
    sig = Token.create_sig(@key, @uid, ts, ttl)

    # URL-Encode would be done by HTTPotion
    # with `query` option as an Elixir Map
    HTTPotion.get(@exmaple_url,
      query: %{
        ts: ts,
        ttl: ttl,
        uid: @uid,
        sig: sig,
        location: "beijing"
      }
    )
  end
end
