class CommandInjController < ApplicationController
  def index
    # 1 Code Inj and 14 Comm Inj
    @param_code_inj = params[:param_code_inj] || ''
    # Code Inj
    eval(@param_code_inj)                                                     # CHECKED by brakeman

    @param_comm_inj = params[:param_comm_inj] || ''
    # Command Injection
    system("echo 'SYS' && " + @param_comm_inj)                                # CHECKED by brakeman
    puts `echo 'BTs' && #{@param_comm_inj}` # (backticks contain os command)  # CHECKED by brakeman
    exec("echo 'EXEC' && " + @param_comm_inj)                                 # CHECKED by brakeman
    spawn("echo 'SPAWN' && " + @param_comm_inj)                               # CHECKED by brakeman
    open("| echo 'OPEN' && " + @param_comm_inj)                               # CHECKED by brakeman
    Process.exec("echo 'PROC_EXEC' && " + @param_comm_inj)                    # CHECKED by brakeman           
    Process.spawn("echo 'PROC_SPAWN' && " + @param_comm_inj)                  # CHECKED by brakeman
    IO.binread("| echo 'IO_BINREAD' && " + @param_comm_inj)
    IO.binwrite("| echo 'IO_BINWRITE' && " + @param_comm_inj, " && ")
    IO.foreach("| echo 'IO_FOREACH' && " + @param_comm_inj) {}                # CHECKED by brakeman
    IO.popen("echo 'IO_POPEN' && " + @param_comm_inj)                         # CHECKED by brakeman
    IO.read("| echo 'IO_READ' && " + @param_comm_inj)                         # CHECKED by brakeman
    IO.readlines("| echo 'IO_READLINES' && " + @param_comm_inj)               # CHECKED by brakeman
    IO.write("| echo 'IO_WRITE' && " + @param_comm_inj, "foo")
  end
end
