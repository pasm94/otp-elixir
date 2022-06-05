defmodule LearnTask do
  def send_mail(email \\ "test@test.com") do
    send = fn ->
      Process.sleep(5000)
      "Mail sent to #{email}"
    end

    Task.async(send)
  end
end

# iex> flush mostra os ultimos processos executados
# posso pegar a task, ex: Task.await(Task.async(send))

# Agent
