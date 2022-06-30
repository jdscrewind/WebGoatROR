class CommandInjController < ApplicationController
  def index
    @param_code_inj = params[:param_code_inj] || ''
    # Code Inj
    eval(@param_code_inj)

    @param_comm_inj = params[:param_comm_inj] || ''
    # Command Injection
    system("echo 'SYS' && " + @param_comm_inj)
    puts `echo 'BTs' && #{@param_comm_inj}` # (backticks contain os command)
    exec("echo 'EXEC' && " + @param_comm_inj)
    spawn("echo 'SPAWN' && " + @param_comm_inj)
    open("| echo 'OPEN' && " + @param_comm_inj)
    Process.exec("echo 'PROC_EXEC' && " + @param_comm_inj)
    Process.spawn("echo 'PROC_SPAWN' && " + @param_comm_inj)
    IO.binread("| echo 'IO_BINREAD' && " + @param_comm_inj)
    IO.binwrite("| echo 'IO_BINWRITE' && " + @param_comm_inj, " && ")
    IO.foreach("| echo 'IO_FOREACH' && " + @param_comm_inj) {}
    IO.popen("echo 'IO_POPEN' && " + @param_comm_inj)
    IO.read("| echo 'IO_READ' && " + @param_comm_inj)
    IO.readlines("| echo 'IO_READLINES' && " + @param_comm_inj)
    IO.write("| echo 'IO_WRITE' && " + @param_comm_inj, "foo")
  end
end
