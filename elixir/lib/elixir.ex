defmodule SeniverseDemo do
  @moduledoc false
  import DateTime

  @exmaple_url "https://api.seniverse.com/v3/weather/now.json"
  @uid "your_public_key"
  @key "your_private_key"

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
    sig = get_sig(ts, ttl)

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

  defp get_sig(ts, ttl) do
    :crypto.hmac(:sha, @key, "ts=#{ts}&ttl=#{ttl}&uid=#{@uid}") |> Base.encode64()
  end
end
