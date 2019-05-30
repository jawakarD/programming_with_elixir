prefix = fn prefix -> 
            fn string -> 
              IO.puts(prefix <> " " <> string)
            end
        end



mrs = prefix.("Mrs")
mrs.("Smith")
prefix.("Elixir").("Rocks")
