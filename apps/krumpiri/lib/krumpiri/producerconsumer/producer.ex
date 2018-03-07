defmodule Krumpiri.Producer do

  alias Krumpiri.Consumer

  def produce do
    IO.puts "Produced!"

    Task.start(&Consumer.consume/0)
  end


end