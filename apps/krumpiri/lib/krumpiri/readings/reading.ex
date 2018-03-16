defmodule Reading do

  @enforce_keys [:net_in_wh, :read_time, :signature, :username]

  defstruct @enforce_keys

end
