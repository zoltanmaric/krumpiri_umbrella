defmodule Clients.Simulator do
  @moduledoc false

  alias Clients.SmartMeter

  def report_readings(num_clients, interval_ms, num_readings) do
    1..num_clients
    |> Task.async_stream(&generate_and_report(&1, interval_ms, num_readings), timeout: 3600000, max_concurrency: num_clients)
    |> Stream.run
  end

  defp generate_and_report(user_index, interval_ms, num_readings) do
    SmartMeter.generate_readings(round(:rand.uniform() * 1000), interval_ms, num_readings)
    |> Stream.map(&to_json(user_index, &1))
    |> Stream.map(&send/1)
    |> Stream.run
  end

  defp to_json(user_index, net_in_wh) do
    Poison.encode! %{
      "net_in_wh" => net_in_wh,
      "read_time" => DateTime.utc_now(),
      "signature" => "signature",
      "username" => "user_#{user_index}"
    }
  end

  defp send(reading) do
    HTTPoison.post!("http://localhost:4000/api/submit", reading, [{"Content-Type", "application/json"}])
  end

end

