defmodule ModuleFinder do
  def float_to_string_2(float, options) do
    :erlang.float_to_binary(flaot, [options])
  end

  def operating_system_env(env) do
    System.get_env(env)
  end

  def get_file_ext_name(file) do
    File.extname(file)
  end

  def cwd do
    File.cwd
  end
  
  #to convert JSON to elixir data Structure use: POISON module
  
  def exec_system_cmd(cmd, args) do
    System.cmd(cmd, args)
  end
end
