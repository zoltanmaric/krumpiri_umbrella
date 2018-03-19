defmodule Clients.SmartMeter do
  @moduledoc false

  def stream_readings(initial_delay_ms, interval_ms, num_readings) do
    first_tick = Stream.timer(initial_delay_ms)
    subsequent_ticks = Stream.interval(interval_ms)

    Stream.concat(first_tick, subsequent_ticks)
    |> Stream.map(fn _ -> random_reading end)
    |> Stream.scan(0, &(&1 + &2))
    |> Stream.each(&IO.puts/1)
    |> Enum.take(num_readings)
  end

  defp random_reading() do
   :rand.normal()
  end


end
