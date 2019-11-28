defmodule StringInMapFinder do
	def replace_strings do
		env_vars = %{
 			"DOCKUP_BACKEND" => "fake",
  		"DOCKUP_BASE_DOMAIN" => "${DOCKUP_PORT_ENDPOINT_dockup-pro_4000}",
 			"DOCKUP_URL_HOST" => "${DOCKUP_PORT_ENDPOINT_dockup-pro_4000}",
  		"PGHOST" => "${DOCKUP_SERVICE_postgres}",
  		"PGPASSWORD" => "secret",
  		"PGUSER" => "user"
		}	
		result = Enum.reduce(env_vars, %{}, fn ({name, value}, acc) -> 
			cond do
				String.match?(value, ~r/\${DOCKUP_PORT_ENDPOINT_.*}/) ->
					case Regex.named_captures(~r/\${DOCKUP_PORT_ENDPOINT_(?<container_name>.+)_(?<port>\d+)}/, value) do
						%{"port" => port, "container_name" => container_name} ->
							Map.put(acc, name, "${DOCKUP_EXTERNAL_HOSTANME_#{container_name}_#{port}}")
						nil ->
							false
					end

				String.match?(value, ~r/\${DOCKUP_SERVICE_.*}/) -> 
					case Regex.named_captures(~r/\${DOCKUP_SERVICE_(?<container_name>.+)}/, value) do
						%{"container_name" => container_name} -> 
							Map.put(acc, name, "${DOCKUP_INTERNAL_HOSTNAME_#{container_name}}")
						nil ->
							false
					end

				true ->
					Map.put(acc, name, value) 
			end
		end) 
		IO.inspect result 		
	end
end

